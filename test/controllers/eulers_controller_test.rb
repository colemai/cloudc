require 'test_helper'

class EulersControllerTest < ActionController::TestCase
  setup do
    @euler = eulers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eulers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create euler" do
    assert_difference('Euler.count') do
      post :create, euler: {  }
    end

    assert_redirected_to euler_path(assigns(:euler))
  end

  test "should show euler" do
    get :show, id: @euler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @euler
    assert_response :success
  end

  test "should update euler" do
    patch :update, id: @euler, euler: {  }
    assert_redirected_to euler_path(assigns(:euler))
  end

  test "should destroy euler" do
    assert_difference('Euler.count', -1) do
      delete :destroy, id: @euler
    end

    assert_redirected_to eulers_path
  end
end
