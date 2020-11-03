class WatchList < ApplicationRecord
    belongs_to :user
    has_many :stocks
    # belongs_to :stock

    validates :list_name, presence: true, uniqueness: true

    accepts_nested_attributes_for :stocks, reject_if: proc { |attributes| attributes['name'].blank? || attributes['ticker'].blank? || attributes['value'].blank? }
end
