class AddBoardReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :board_reviews, :score
  end
end
