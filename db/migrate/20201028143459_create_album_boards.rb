class CreateAlbumBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :album_boards do |t|
      t.string :albums, null: false
      t.text :icon

      t.timestamps
    end
  end
end
