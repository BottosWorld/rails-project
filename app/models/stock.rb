class Stock < ApplicationRecord
    belongs_to :portfolio
    belongs_to :watchlist
    # has_many :portfolios
    # has_many :users, through: :portfolios
    # aliasing
    # has_many :watchlists
    # has_many :users, through: :watchlists

    scope :elite_stocks, -> { where("stocks.value BETWEEN 10.00 AND 99.9999") }
    scope :legendary_stocks, -> { where("stocks.value BETWEEN 100.00 AND 9999.9999") }
    scope :common_stocks, -> { where("stocks.value BETWEEN 1.00 AND 9.9999") }
    scope :penny_stocks, -> { where("stocks.value BETWEEN 0.0001 AND 0.9999") }
    scope :mythic_stocks, -> { where("stocks.value BETWEEN 10000.00 AND 9999999.9999") }

    validates_presence_of :ticker, :name, :value
    validates_uniqueness_of :ticker, :name
end