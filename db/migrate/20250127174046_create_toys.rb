class CreateToys < ActiveRecord::Migration[7.1]
  def change
    create_table :toys do |t|
      t.string :name
      t.string :location
      t.string :category
      t.string :description
      t.string :condition
      t.string :status
      t.string :need_in_return
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
