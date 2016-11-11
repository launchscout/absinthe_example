defmodule Blog.Address do
  use Blog.Web, :model

  schema "addresses" do
    field :line1, :string
    field :city, :string
    field :state, :string
    field :zip, :string
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:line1, :city, :state, :zip])
    |> validate_required([:line1, :city, :state, :zip])
  end
end
