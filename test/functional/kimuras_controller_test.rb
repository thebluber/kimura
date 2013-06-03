require 'test_helper'

class KimurasControllerTest < ActionController::TestCase
  setup do
    @kimura = kimuras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kimuras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kimura" do
    assert_difference('Kimura.count') do
      post :create, :kimura => { :kimura_column => @kimura.kimura_column, :kimura_hasCandidates => @kimura.kimura_hasCandidates, :kimura_isEdited => @kimura.kimura_isEdited, :kimura_lemma => @kimura.kimura_lemma, :kimura_page => @kimura.kimura_page, :kimura_reading => @kimura.kimura_reading, :kimura_wadoku_candidates => @kimura.kimura_wadoku_candidates }
    end

    assert_redirected_to kimura_path(assigns(:kimura))
  end

  test "should show kimura" do
    get :show, :id => @kimura
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @kimura
    assert_response :success
  end

  test "should update kimura" do
    put :update, :id => @kimura, :kimura => { :kimura_column => @kimura.kimura_column, :kimura_hasCandidates => @kimura.kimura_hasCandidates, :kimura_isEdited => @kimura.kimura_isEdited, :kimura_lemma => @kimura.kimura_lemma, :kimura_page => @kimura.kimura_page, :kimura_reading => @kimura.kimura_reading, :kimura_wadoku_candidates => @kimura.kimura_wadoku_candidates }
    assert_redirected_to kimura_path(assigns(:kimura))
  end

  test "should destroy kimura" do
    assert_difference('Kimura.count', -1) do
      delete :destroy, :id => @kimura
    end

    assert_redirected_to kimuras_path
  end
end
