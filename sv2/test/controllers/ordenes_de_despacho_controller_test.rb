require 'test_helper'

class OrdenesDeDespachoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get programar" do
    get :programar
    assert_response :success
  end

  test "should get despachar" do
    get :despachar
    assert_response :success
  end

end
