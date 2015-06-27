require 'test_helper'

class OrdertransactionsControllerTest < ActionController::TestCase
  setup do
    @ordertransaction = ordertransactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordertransactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordertransaction" do
    assert_difference('Ordertransaction.count') do
      post :create, ordertransaction: {  }
    end

    assert_redirected_to ordertransaction_path(assigns(:ordertransaction))
  end

  test "should show ordertransaction" do
    get :show, id: @ordertransaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ordertransaction
    assert_response :success
  end

  test "should update ordertransaction" do
    patch :update, id: @ordertransaction, ordertransaction: {  }
    assert_redirected_to ordertransaction_path(assigns(:ordertransaction))
  end

  test "should destroy ordertransaction" do
    assert_difference('Ordertransaction.count', -1) do
      delete :destroy, id: @ordertransaction
    end

    assert_redirected_to ordertransactions_path
  end
end
