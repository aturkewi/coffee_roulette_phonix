defmodule CoffeeRoulettePhx.EmployeeTest do
  use CoffeeRoulettePhx.ModelCase

  alias CoffeeRoulettePhx.Employee

  @valid_attrs %{company_id: 42, email: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Employee.changeset(%Employee{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Employee.changeset(%Employee{}, @invalid_attrs)
    refute changeset.valid?
  end
end
