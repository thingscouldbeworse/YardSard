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
      raise @yard_sale.user.inspect + User.all.inspect + YardSale.all.inspect
      post :create, yard_sale: {
        address: @yard_sale.address,
        community_id: @yard_sale.community_id,
        start: @yard_sale.start,
        end: @yard_sale.end,
        user_id: @yard_sale.user.id,
        zip: @yard_sale.zip
      }
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
    patch :update, id: @yard_sale, yard_sale: {
      address: @yard_sale.address,
      community_id: @yard_sale.community_id,
      start: @yard_sale.start,
      end: @yard_sale.end,
      user: @yard_sale.user,
      zip: @yard_sale.zip
    }
    assert_response :success # yard sales now render(...) instead of redirect_to(...)
    # assert_redirected_to yard_sale_path(assigns(:yard_sale))
  end

  test "should destroy yard_sale" do
    assert_difference('YardSale.count', -1) do
      delete :destroy, id: @yard_sale
    end

    assert_redirected_to yard_sales_path
  end
end
