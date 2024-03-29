class YardSalesController < ApplicationController
  load_and_authorize_resource
  before_action :set_yard_sale, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: :user

  layout 'small-center', only: [:new, :edit]

  respond_to :html

  def index
    @yard_sales = current_user.is_manager? ? YardSale.all : YardSale.upcoming
    respond_with(@yard_sales)
  end

  def user
    @yard_sales = YardSale.where(user: @user.id)
    render(action: :index)
  end

  def show
    @items = @yard_sale.items
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
    # set to active
    @yard_sale.user = current_user # TODO validate that user is logged in
    if @yard_sale.valid?
      @yard_sale.save
      # set origin to @yard_sale.id, then save! again
      @items = []
      render(action: :show, layout: 'application') # TODO change layout
    else
      render(action: :new, layout: 'small-center')
    end
  end

  def update
    if @yard_sale.valid?
      old_yard_sale = @yard_sale.clone.save!
      # set old yard sale not true
      @yard_sale.update(yard_sale_params)
      @items = @yard_sale.items
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
