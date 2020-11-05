class AddWatchListToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :watch_list_id, :integer
    add_index :stocks, :watch_list_id
  end
end
