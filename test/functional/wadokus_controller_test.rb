require 'test_helper'

class WadokusControllerTest < ActionController::TestCase
  setup do
    @wadoku = wadokus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wadokus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wadoku" do
    assert_difference('Wadoku.count') do
      post :create, :wadoku => { :contents => @wadoku.contents, :entry => @wadoku.entry }
    end

    assert_redirected_to wadoku_path(assigns(:wadoku))
  end

  test "should show wadoku" do
    get :show, :id => @wadoku
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wadoku
    assert_response :success
  end

  test "should update wadoku" do
    put :update, :id => @wadoku, :wadoku => { :contents => @wadoku.contents, :entry => @wadoku.entry }
    assert_redirected_to wadoku_path(assigns(:wadoku))
  end

  test "should destroy wadoku" do
    assert_difference('Wadoku.count', -1) do
      delete :destroy, :id => @wadoku
    end

    assert_redirected_to wadokus_path
  end
end
