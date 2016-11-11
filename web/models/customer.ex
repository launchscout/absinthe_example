defmodule Blog.Customer do
  use Blog.Web, :model

  schema "customers" do
    field :name, :string
    has_many :pets, Blog.Pet, foreign_key: :owner_id
    belongs_to :address, Blog.Address

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
