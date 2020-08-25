class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.integer :stock_id
      t.decimal :investing

      t.timestamps
    end
  end
end
