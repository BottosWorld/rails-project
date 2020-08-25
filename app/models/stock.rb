class Stock < ApplicationRecord
    has_many :portfolios
    has_many :users, through: :portfolios
    has_many :watchlists
    has_many :users, through: :watchlists
end
