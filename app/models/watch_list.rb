class WatchList < ApplicationRecord
    belongs_to :user
    has_many :stocks, dependent: :destroy
    # belongs_to :stock

    validates :list_name, presence: true, uniqueness: true

    accepts_nested_attributes_for :stocks, reject_if: :all_blank, allow_destroy: true
    # used :all_blank instead of this - proc { |attributes| attributes['name'].blank? || attributes['ticker'].blank? || attributes['value'].blank? }
end
