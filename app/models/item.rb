class Item < ActiveRecord::Base
  belongs_to :yard_sale

  validates :title,       presence: true
  validates :description, allow_blank: true, length: { minimum: 1, maximum: 999 }
  validates :pic,         allow_blank: true, url: true
  validates :price_cents, presence: true
  validates :yard_sale,   presence: true

  scope :promoted, -> { where(promoted: true) }

  def price_txt
    sprintf("$%0.02f", price)
  end

  def ad_price_txt
    ad_price_cents ? sprintf("$%0.02f", ad_price) : nil
  end

  def price
    price_cents.to_i / 100.0
  end

  def ad_price
    ad_price_cents.to_i / 100.0
  end
end
