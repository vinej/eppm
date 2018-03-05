defmodule Eppm.PlansTest do
  use Eppm.DataCase

  alias Eppm.Plans

  describe "plans" do
    alias Eppm.Plans.Plan

    @valid_attrs %{code: "some code", name: "some name"}
    @update_attrs %{code: "some updated code", name: "some updated name"}
    @invalid_attrs %{code: nil, name: nil}

    def plan_fixture(attrs \\ %{}) do
      {:ok, plan} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Plans.create_plan()

      plan
    end

    test "list_plans/0 returns all plans" do
      plan = plan_fixture()
      assert Plans.list_plans() == [plan]
    end

    test "get_plan!/1 returns the plan with given id" do
      plan = plan_fixture()
      assert Plans.get_plan!(plan.id) == plan
    end

    test "create_plan/1 with valid data creates a plan" do
      assert {:ok, %Plan{} = plan} = Plans.create_plan(@valid_attrs)
      assert plan.code == "some code"
      assert plan.name == "some name"
    end

    test "create_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plans.create_plan(@invalid_attrs)
    end

    test "update_plan/2 with valid data updates the plan" do
      plan = plan_fixture()
      assert {:ok, plan} = Plans.update_plan(plan, @update_attrs)
      assert %Plan{} = plan
      assert plan.code == "some updated code"
      assert plan.name == "some updated name"
    end

    test "update_plan/2 with invalid data returns error changeset" do
      plan = plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Plans.update_plan(plan, @invalid_attrs)
      assert plan == Plans.get_plan!(plan.id)
    end

    test "delete_plan/1 deletes the plan" do
      plan = plan_fixture()
      assert {:ok, %Plan{}} = Plans.delete_plan(plan)
      assert_raise Ecto.NoResultsError, fn -> Plans.get_plan!(plan.id) end
    end

    test "change_plan/1 returns a plan changeset" do
      plan = plan_fixture()
      assert %Ecto.Changeset{} = Plans.change_plan(plan)
    end
  end
end
