defmodule Blog.Repo.Migrations.AddAddressAndAge do
  use Ecto.Migration

  def change do

    create table(:addresses) do
      add :line1, :string
      add :city, :string
      add :state, :string
      add :zip, :string
    end

    alter table(:customers) do
      add :address_id, references(:addresses)
    end
  end
end
