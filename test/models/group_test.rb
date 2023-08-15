require "test_helper"

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = Group.new(name: "Example Group", owner_id: 1)
  end

  test "should be valid" do
    assert @group.valid?
  end

  test "name should be present" do
    @group.name = " "
    assert @group.invalid?
  end

  test "name should not be too long" do
    @group.name = "a" * 51
    assert @group.invalid?
  end
end
