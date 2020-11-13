class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :stocks

    validates_presence_of :investing
    validates_uniqueness_of :user_id

    accepts_nested_attributes_for :stocks
end
