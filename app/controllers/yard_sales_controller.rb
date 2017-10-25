class YardSalesController < ApplicationController
  before_action :set_yard_sale, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @yard_sales = YardSale.all
    respond_with(@yard_sales)
  end

  def show
    respond_with(@yard_sale)
  end

  def new
    @yard_sale = YardSale.new
    respond_with(@yard_sale)
  end

  def edit
  end

  def create
    @yard_sale = YardSale.new(yard_sale_params)
    @yard_sale.save
    respond_with(@yard_sale)
  end

  def update
    @yard_sale.update(yard_sale_params)
    respond_with(@yard_sale)
  end

  def destroy
    @yard_sale.destroy
    respond_with(@yard_sale)
  end

  private
    def set_yard_sale
      @yard_sale = YardSale.find(params[:id])
    end

    def yard_sale_params
      params.require(:yard_sale).permit(:start, :end, :zip, :address, :community_id, :user_id)
    end
end
