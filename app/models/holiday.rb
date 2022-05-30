class Holiday < ApplicationRecord

    has_many :follow_requests, dependent: :destroy
end
