class PagesController < ApplicationController
  def home
  end

  def search
    @yard_sales = YardSale.where(zip: params[:q])
    @items = Item.where('lower(title) LIKE ? OR lower(description) LIKE ?',
                        "%#{ params[:q] }%", "%#{ params[:q] }%")
  end
end
