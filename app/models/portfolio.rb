class Portfolio < ApplicationRecord
    belongs_to :user
    belongs_to :stock

    validates_presence_of :investing
    validates_uniqueness_of :user_id
end
