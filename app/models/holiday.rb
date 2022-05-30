class Holiday < ApplicationRecord
    has_many :users, through: :belongings
    has_many :follow_requests, dependent: :destroy
end
