class User < ApplicationRecord
    has_one :portfolio
    has_many :stocks, through: :portfolio
    has_many :watchlists
    has_many :stocks, through: :watchlists

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true
    validates :password_digest, length: { minimum: 8 }
end
