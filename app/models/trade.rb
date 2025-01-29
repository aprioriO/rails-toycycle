class Trade < ApplicationRecord
  belongs_to :toy_seeker, class_name: "Toy", foreign_key: "toy_seeker_id"
  belongs_to :toy_trader, class_name: "Toy", foreign_key: "toy_trader_id"
end
