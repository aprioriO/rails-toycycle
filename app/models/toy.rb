class Toy < ApplicationRecord
  belongs_to :user

  has_many :trades_as_seeker, class_name: "Trade", foreign_key: :seeker_toy_id
  has_many :trades_as_trader, class_name: "Trade", foreign_key: :trader_toy_id

  validates :name, :location, :category, :description, :condition, :status, :need_in_return, presence: true

  has_one_attached :photo
end
