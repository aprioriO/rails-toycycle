class Trade < ApplicationRecord
  belongs_to :seeker, class_name: "User"
  belongs_to :trader, class_name: "User"

  belongs_to :seeker_toy, class_name: "Toy", foreign_key: "toy_seeker_id"
  belongs_to :trader_toy, class_name: "Toy", foreign_key: "trader_toy_id"

  has_many :messages
end
