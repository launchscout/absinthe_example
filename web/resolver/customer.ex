defmodule Blog.Resolver.Customer do

  alias Blog.Customer
  alias Blog.Repo

  def all(_, _) do
    {:ok, Repo.all(Customer) |> Repo.preload(:pets) }
  end

  def find(%{id: id}, _) do
    case Repo.get(Customer, id) do
      nil  -> {:error, "Customer id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def create(%{customer_attributes: customer_attributes}, _) do
    changeset = Customer.changeset(%Customer{}, customer_attributes)
    case Repo.insert(changeset) do
      {:ok, customer} -> {:ok, customer}
      {:error, changeset} -> {:error, changeset.errors}
    end
  end

  def update(%{id: id, customer_attributes: customer_attributes}, _) do
    customer = Repo.get!(Customer, id)
    changeset = Customer.changeset(customer, customer_attributes)
    case Repo.update(changeset) do
      {:ok, customer} -> {:ok, customer}
      {:error, changeset} -> {:error, changeset.errors}
    end
  end

end
