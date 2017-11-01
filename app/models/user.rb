class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :rememberable,
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :yard_sales, inverse_of: :user

  validates :name, presence: true
  validates :pic, url: true, allow_blank: true
end
