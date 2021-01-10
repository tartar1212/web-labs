require 'test_helper'

class ClientControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get client_input_url
    assert_response :success
  end

  test "should get output" do
    get client_output_url
    assert_response :success
  end

end
