class CreateJoinTableWatchListsStocks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :watch_lists, :stocks do |t|
       t.index [:watch_list_id, :stock_id]
       t.index [:stock_id, :watch_list_id]
    end
  end
end
