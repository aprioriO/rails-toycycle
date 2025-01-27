class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.references :toy_seeker, foreign_key: {to_table: :toys}
      t.references :toy_trader, foreign_key: {to_table: :toys}

      t.timestamps
    end
  end
end
