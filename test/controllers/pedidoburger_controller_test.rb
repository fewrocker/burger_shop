require 'test_helper'

class PedidoburgerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pedidoburger_new_url
    assert_response :success
  end

  test "should get create" do
    get pedidoburger_create_url
    assert_response :success
  end

end
