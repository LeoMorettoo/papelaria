require 'test_helper'

class PurchaseHistoricsControllerTest < ActionController::TestCase
  setup do
    @purchase_historic = purchase_historics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_historics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_historic" do
    assert_difference('PurchaseHistoric.count') do
      post :create, purchase_historic: { client_id: @purchase_historic.client_id, createDate: @purchase_historic.createDate, discount: @purchase_historic.discount, paidStatus: @purchase_historic.paidStatus, product_id: @purchase_historic.product_id, quantity: @purchase_historic.quantity }
    end

    assert_redirected_to purchase_historic_path(assigns(:purchase_historic))
  end

  test "should show purchase_historic" do
    get :show, id: @purchase_historic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_historic
    assert_response :success
  end

  test "should update purchase_historic" do
    patch :update, id: @purchase_historic, purchase_historic: { client_id: @purchase_historic.client_id, createDate: @purchase_historic.createDate, discount: @purchase_historic.discount, paidStatus: @purchase_historic.paidStatus, product_id: @purchase_historic.product_id, quantity: @purchase_historic.quantity }
    assert_redirected_to purchase_historic_path(assigns(:purchase_historic))
  end

  test "should destroy purchase_historic" do
    assert_difference('PurchaseHistoric.count', -1) do
      delete :destroy, id: @purchase_historic
    end

    assert_redirected_to purchase_historics_path
  end
end
