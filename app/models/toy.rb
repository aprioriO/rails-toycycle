class Toy < ApplicationRecord
  belongs_to :user

  has_many :trades_as_seeker, class_name: "Trade", foreign_key: :toy_seeker_id
  has_many :trades_as_trader, class_name: "Trade", foreign_key: :toy_trader_id

  validates :name, :location, :category, :description, :condition, :status, :need_in_return, presence:true

end
