class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.references :seeker_toy, foreign_key: {to_table: :toys}
      t.references :trader_toy, foreign_key: {to_table: :toys}
      t.references :trader, foreign_key: {to_table: :users}
      t.references :seeker, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
