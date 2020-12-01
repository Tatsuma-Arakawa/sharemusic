class AddTitleToBoardReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :board_reviews, :title, :string, null: false
  end
end
