class User < ApplicationRecord
    has_one :portfolio
    has_many :stocks, through: :portfolio
    has_many :watchlists
    has_many :stocks, through: :watchlists

    validates :first_name, :last_name, presence: true
    validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :email, uniqueness: true
    validates :password_digest, format: {with: /length: { minimum: 8 }/, message: "must contain at least 8 characters"}
end
