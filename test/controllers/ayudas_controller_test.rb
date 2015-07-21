require 'test_helper'

class AyudasControllerTest < ActionController::TestCase
  setup do
    @ayuda = ayudas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ayudas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ayuda" do
    assert_difference('Ayuda.count') do
      post :create, ayuda: { nombre: @ayuda.nombre }
    end

    assert_redirected_to ayuda_path(assigns(:ayuda))
  end

  test "should show ayuda" do
    get :show, id: @ayuda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ayuda
    assert_response :success
  end

  test "should update ayuda" do
    patch :update, id: @ayuda, ayuda: { nombre: @ayuda.nombre }
    assert_redirected_to ayuda_path(assigns(:ayuda))
  end

  test "should destroy ayuda" do
    assert_difference('Ayuda.count', -1) do
      delete :destroy, id: @ayuda
    end

    assert_redirected_to ayudas_path
  end
end
