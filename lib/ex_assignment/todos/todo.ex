defmodule ExAssignment.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field(:done, :boolean, default: false)
    field(:priority, :integer)
    field(:title, :string)
    field(:is_recommended, :boolean, default: false)

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :priority, :done, :is_recommended])
    |> validate_required([:title, :priority, :done])
  end
end
