class WatchList < ApplicationRecord
    belongs_to :user
    has_many :stocks, dependent: :destroy

    validates :list_name, presence: true, uniqueness: true

    accepts_nested_attributes_for :stocks, reject_if: :all_blank, allow_destroy: true

end
