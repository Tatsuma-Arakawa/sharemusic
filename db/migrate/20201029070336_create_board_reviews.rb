class CreateBoardReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :board_reviews do |t|
      t.text :content, null: false
      t.bigint :album_board_id, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
