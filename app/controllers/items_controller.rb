class ItemsController < ApplicationController
  load_and_authorize_resource
  before_action :set_item, only: [:show, :edit, :update, :destroy, :edit_ad, :update_ad, :promote]
  before_action :set_promoted, only: [:show, :edit, :update, :destroy, :promote]

  layout 'small-center', only: [:new, :create, :edit, :update, :show, :edit_ad, :update_ad, :promote]

  respond_to :html

  def index
    @items = Item.all
    respond_with(@items)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
  end

  def edit_ad
  end

  def create
    @item = Item.new(item_params)
    @item.ad_price_cents = @item.price_cents / 10
    if @item.valid?
      @item.save
      render(action: :show)
    else
      render(action: :new)
    end
  end

  def update
    @item.ad_price_cents = @item.price_cents / 10
    if @item.update(item_params)
      render(action: :show)
    else
      render(action: :new)
    end
  end

  def update_ad
    if @item.update(item_params)
      render(action: :show)
    else
      render(action: :new)
    end
  end

  def promote
    @item.promoted = true
    @item.promoted_at = DateTime.now
    @item.save!
    render(action: :show)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private

    def set_promoted
      @small_center_class << "promoted" if @item.promoted?
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :pic, :price_cents, :ad_price_cents, :yard_sale_id)
    end
end
