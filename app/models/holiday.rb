class Holiday < ApplicationRecord
    has_many :users, through: :follow_requests
    has_many :follow_requests, dependent: :destroy
    enum result: { 承認済: true, 未承認: false }
end
