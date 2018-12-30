require 'test_helper'

class EnderecoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get endereco_new_url
    assert_response :success
  end

  test "should get create" do
    get endereco_create_url
    assert_response :success
  end

end
