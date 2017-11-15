class YardSalesController < ApplicationController
  before_action :set_yard_sale, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: :user

  layout 'small-center', only: [:new, :edit]

  respond_to :html

  def index
    @yard_sales = YardSale.all
    respond_with(@yard_sales)
  end

  def user
    @yard_sales = YardSale.where(user: @user.id)
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
    @yard_sale.user = current_user # TODO validate that user is logged in
    if @yard_sale.valid?
      @yard_sale.save
      render(action: :show, layout: 'application') # TODO change layout
    else
      render(action: :new, layout: 'small-center')
    end
  end

  def update
    if @yard_sale.update(yard_sale_params)
      render(action: :show, layout: 'application') # TODO change layout
    else
      render(action: :new, layout: 'small-center')
    end
  end

  def destroy
    @yard_sale.destroy
    respond_with(@yard_sale)
  end

  private
    def set_yard_sale
      @yard_sale = YardSale.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def yard_sale_params
      params.require(:yard_sale).permit(:start, :end_enable, :end, :zip, :address, :community_id, :user_id)
    end
end
