class Attendance < ApplicationRecord
    belongs_to :user
    has_many :logs, through: :user
    validates :attendance_time, presence: true
    validates :attendance_date, presence: true, uniqueness: { scope: :user_id }
    def start_time
        self.attendance_date #self.の後はsimple_calendarに表示させるためのカラムを指定
      end

   
   
end
