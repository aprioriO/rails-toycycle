class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :toys

  has_many :trades_as_trader, class_name: "Trade", foreign_key: :trader_id
  has_many :trades_as_seeker, class_name: "Trade", foreign_key: :seeker_id

  validates :username, presence: true, uniqueness: true
  validates :description, presence: true
end
