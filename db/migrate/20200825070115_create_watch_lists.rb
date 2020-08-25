class CreateWatchLists < ActiveRecord::Migration[6.0]
  def change
    create_table :watch_lists do |t|
      t.integer :user_id
      t.integer :stock_id
      t.string :list_name

      t.timestamps
    end
  end
end
