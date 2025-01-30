class AddStatusToTrades < ActiveRecord::Migration[7.1]
  def change
    add_column :trades, :status, :string, default: "pending", null: false
  end
end
