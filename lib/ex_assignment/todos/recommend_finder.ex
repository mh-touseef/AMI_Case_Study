defmodule RecommendFinder do
  @moduledoc false

  def recommended(raw_todos) do
  todos = Enum.map(raw_todos, &{&1.id, &1.priority})

    # Step 1: Calculate urgency (inverse of priority)
    urgencies = Enum.map(todos, fn {task, priority} -> {task, 1.0 / priority} end)

    # Step 2: Calculate total urgency
    total_urgency = Enum.reduce(urgencies, 0.0, fn {_, urgency}, acc -> acc + urgency end)

    # Step 3: Normalize to get probabilities
    probabilities = Enum.map(urgencies, fn {task, urgency} -> {task, urgency / total_urgency} end)

    # Step 4: Randomly select a todo based on probabilities

    recommended_todo_id = random_select(probabilities)
    Enum.find(raw_todos, &(&1.id == recommended_todo_id))
  end

  defp random_select(probabilities) do
    random_value = :rand.uniform()

    probabilities
    |> Enum.reduce_while(0.0, fn {task, prob}, acc ->
      if random_value <= acc + prob do
        {:halt, task}
      else
        {:cont, acc + prob}
      end
    end)
  end
end
