require 'test_helper'

class FindsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get finds_index_url
    assert_response :success
  end

end
