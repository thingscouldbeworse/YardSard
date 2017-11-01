class YardSale < ActiveRecord::Base
  #belongs_to :community # TODO: bring this command back
  belongs_to :user

  validate :start,     presence: true
  validate :zip,       numericality: { greater_than: 0, less_than: 100_000, only_integer: true }
  validate :address,   presence: true, length: { minimum: 1 }
  validate :user,      presence: true
  validate :end_cannot_be_before_start
  validate :end_cannot_be_in_the_past, only: :create

  alias_attribute :start_time, :start
  alias_attribute :end_time, :end

  def end_enable
    false
  end

  def start_txt
    start_time.strftime("%F<br/>%I:%M %p").html_safe
  end

  def end_txt
    end_time ? end_time.strftime("%F<br/>%I:%M %p").html_safe : ""
  end

  private
  
  def end_cannot_be_before_start
    errors.add(:end,"must come after Start time") if end_time && end_time < start_time
  end # end_cannot_be_before_start

  def end_cannot_be_in_the_past
    errors.add(:end,"cannot be in the past") if end_time && end_time < Time.now
  end # end_cannot_be_in_the_past
end
