class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  layout 'small-center', only: [:new, :create, :edit, :update, :show]

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

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      render(action: :show)
    else
      render(action: :new)
    end
  end

  def update
    if @item.update(item_params)
      render(action: :show)
    else
      render(action: :new)
    end
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :pic, :price_cents, :ad_price_cents, :yard_sale_id)
    end
end
