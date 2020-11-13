class AddPortfolioToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :portfolio_id, :integer
    add_index :stocks, :portfolio_id
  end
end
