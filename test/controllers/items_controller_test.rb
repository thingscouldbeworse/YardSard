require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { ad_price_cents: @item.ad_price_cents, description: @item.description, pic: @item.pic, price_cents: @item.price_cents, title: @item.title, yard_sale_id: @item.yard_sale_id }
    end

    assert_response :success
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { ad_price_cents: @item.ad_price_cents, description: @item.description, pic: @item.pic, price_cents: @item.price_cents, title: @item.title, yard_sale_id: @item.yard_sale_id }
    assert_response :success
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
