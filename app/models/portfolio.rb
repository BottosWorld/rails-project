class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :stocks
    #not using join table portfolio_Stocks

    validates_presence_of :investing
    validates_uniqueness_of :user_id

    accepts_nested_attributes_for :stocks
end
