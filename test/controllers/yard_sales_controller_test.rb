require 'test_helper'

class YardSalesControllerTest < ActionController::TestCase
  setup do
    @yard_sale = yard_sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yard_sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yard_sale" do
    assert_difference('YardSale.count') do
      post :create, yard_sale: { address: @yard_sale.address, community_id: @yard_sale.community_id, end: @yard_sale.end, start: @yard_sale.start, user_id: @yard_sale.user_id, zip: @yard_sale.zip }
    end

    assert_redirected_to yard_sale_path(assigns(:yard_sale))
  end

  test "should show yard_sale" do
    get :show, id: @yard_sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yard_sale
    assert_response :success
  end

  test "should update yard_sale" do
    patch :update, id: @yard_sale, yard_sale: { address: @yard_sale.address, community_id: @yard_sale.community_id, end: @yard_sale.end, start: @yard_sale.start, user_id: @yard_sale.user_id, zip: @yard_sale.zip }
    assert_redirected_to yard_sale_path(assigns(:yard_sale))
  end

  test "should destroy yard_sale" do
    assert_difference('YardSale.count', -1) do
      delete :destroy, id: @yard_sale
    end

    assert_redirected_to yard_sales_path
  end
end
