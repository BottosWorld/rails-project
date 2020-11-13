class Stock < ApplicationRecord
    belongs_to :portfolio, optional: true
    belongs_to :watchlist, optional: true
    # has_many :portfolios
    # has_many :users, through: :portfolios
    # aliasing
    # has_many :watchlists
    # has_many :users, through: :watchlists

    scope :elite_stocks, -> { where("stocks.value BETWEEN 10.00 AND 99.9999") }
    scope :legendary_stocks, -> { where("stocks.value BETWEEN 100.00 AND 9999.9999") }
    scope :common_stocks, -> { where("stocks.value BETWEEN 1.00 AND 9.9999") }
    scope :penny_stocks, -> { where("stocks.value BETWEEN 0.01 AND 0.9999") }
    scope :mythic_stocks, -> { where("stocks.value BETWEEN 10000.00 AND 9999999.9999") }

    scope :stocks_in_watch_list, -> {where("stocks.watch_list_id IS NOT NULL")}
    scope :stocks_in_portfolio, -> {where.not(stocks: {portfolio_id: nil})}

    #filter through stocks with above scope methods

    validates_presence_of :ticker, :name, :value
    # validates_uniqueness_of :ticker, :name
end