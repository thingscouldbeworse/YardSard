class PagesController < ApplicationController
  def home
  end

  def search
    @yard_sales = YardSale.where(zip: params[:q])
    @items = Item.where('lower(title) LIKE ? OR lower(description) LIKE ?',
                        "%#{ params[:q] }%", "%#{ params[:q] }%")
  end

  def ad
    @this_week  = Item.promoted.where('promoted_at > ?', Time.now - 7.days)
    @this_month = Item.promoted.where('promoted_at > ? AND promoted_at < ?', Time.now - 30.days, Time.now - 7.days)
    @this_year  = Item.promoted.where('promoted_at > ? AND promoted_at < ?', Time.now - 365.days, Time.now - 30.days)
  end

end
