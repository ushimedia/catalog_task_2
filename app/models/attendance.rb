class Attendance < ApplicationRecord
    belongs_to :user
    validates :attendance_time, presence: true
end
