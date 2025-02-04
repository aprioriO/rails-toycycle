class RemoveToyFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reviews, :toy, foreign_key: true
  end
end
