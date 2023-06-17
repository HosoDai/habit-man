require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal "Home | Member Management App", full_title("Home")
  end
end
