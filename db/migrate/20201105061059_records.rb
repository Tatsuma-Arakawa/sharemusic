class Records < ActiveRecord::Migration[5.2]
  def change
    drop_table :average_caches
    drop_table :overall_averages
    drop_table :rating_caches
  end
end
