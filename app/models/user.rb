class User < ApplicationRecord
    has_one :portfolio
    has_many :stocks, through: :portfolio
    has_many :watchlists
    has_many :stocks, through: :watchlists
end
