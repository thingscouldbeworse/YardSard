class YardSale < ActiveRecord::Base
  #belongs_to :community # TODO: bring this command back
  belongs_to :user
  has_many :items, dependent: :destroy, inverse_of: :yard_sale

  validates :start,     presence: true
  validates :zip,       numericality: { greater_than: 0, less_than: 100_000, only_integer: true }
  validates :address,   presence: true
  validates :user,      presence: true

  validate :end_cannot_be_before_start
  validate :end_cannot_be_in_the_past, if: :end_changed?

  scope :upcoming, -> { where('(start > ? AND end IS NULL) OR end > ?', Time.now.beginning_of_day, Time.now) }

  alias_attribute :start_time, :start
  alias_attribute :end_time, :end

  def end_enable=(val)
    @checkbox = val
  end

  def end_enable
    @checkbox || !end_time.nil? || false
  end

  def select_description
    "#{address} (#{start_time.strftime('%F')})"
  end

  def start_txt
    start_time.strftime("%F<br/>%I:%M %p").html_safe
  end

  def end_txt
    end_time ? end_time.strftime("%F<br/>%I:%M %p").html_safe : ""
  end

  def ad_income
    cents = Item.where(yard_sale: id, promoted: true).sum(:ad_price_cents)
    sprintf("$%0.02f", cents / 100.0)
  end

  def total_ad_cost
    cents = Item.where(yard_sale: id).sum(:ad_price_cents)
    sprintf("$%0.02f", cents / 100.0)
  end

  private
  
  def end_cannot_be_before_start
    errors.add(:end,"must come after Start time") if end_time && end_time < start_time
  end # end_cannot_be_before_start

  def end_cannot_be_in_the_past
    errors.add(:end,"cannot be in the past") if end_time && end_time < Time.now
  end # end_cannot_be_in_the_past
end
