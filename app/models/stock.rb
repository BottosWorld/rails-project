class Stock < ApplicationRecord
    belongs_to :portfolio, optional: true
    belongs_to :watchlist, optional: true

    scope :elite_stocks, -> { where("stocks.value BETWEEN 10.00 AND 99.9999") }
    scope :legendary_stocks, -> { where("stocks.value BETWEEN 100.00 AND 9999.9999") }
    scope :common_stocks, -> { where("stocks.value BETWEEN 1.00 AND 9.9999") }
    scope :penny_stocks, -> { where("stocks.value BETWEEN 0.01 AND 0.9999") }
    scope :mythic_stocks, -> { where("stocks.value BETWEEN 10000.00 AND 9999999.9999") }

    scope :stocks_in_watch_list, -> {where("stocks.watch_list_id IS NOT NULL")}
    scope :stocks_in_portfolio, -> {where.not(stocks: {portfolio_id: nil})}

    validates_presence_of :ticker, :name, :value

end