require "test_helper"

class EquipamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get equipaments_index_url
    assert_response :success
  end
end
