defmodule Blog.AddressTest do
  use Blog.ModelCase

  alias Blog.Address

  @valid_attrs %{city: "some content", line1: "some content", state: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Address.changeset(%Address{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Address.changeset(%Address{}, @invalid_attrs)
    refute changeset.valid?
  end
end
