class Item < ActiveRecord::Base
  belongs_to :yard_sale

  validates :title,       presence: true
  validates :description, allow_blank: true, length: { minimum: 1, maximum: 999 }
  validates :pic,         allow_blank: true, url: true
  validates :price_cents, presence: true
  validates :yard_sale,   presence: true

  def price
    price_cents / 100.0
  end

  def ad_price
    ad_price_cents / 100.0
  end
end
