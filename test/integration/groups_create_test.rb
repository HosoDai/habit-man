require "test_helper"

class GroupsCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "invalid create group information" do
    post login_path, params: { session: { email: @user.email,
                                          password: "password"} }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    get new_group_path
    assert_no_difference "Group.count" do
      post groups_path, params: { group: { name: ""} }
    end
    assert_response :unprocessable_entity
    assert_template "groups/new"
    assert_select "div#error_explanation"
    assert_select "div.alert-danger"
  end

  test "valid create group information" do
    post login_path, params: { session: { email: @user.email,
                                          password: "password"} }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    get new_group_path
    assert_difference "Group.count", 1 do
      post groups_path, params: { group: { name: "test group"} }
    end
    follow_redirect!
    assert_template "groups/show"
    assert_not flash.empty?
  end
end
