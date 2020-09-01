class Stock < ApplicationRecord
    has_many :portfolios
    has_many :users, through: :portfolios
    has_many :watchlists
    has_many :users, through: :watchlists

    validates :name, :ticker , presence: true

    def self.new_request
        client = Finnhub::Client.new(key: "brm2kafrh5re8ma1q70g")
    end

end
