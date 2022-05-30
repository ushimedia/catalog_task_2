class HolidayRequest < ApplicationRecord
    belongs_to :user
    belongs_to :holiday
end
