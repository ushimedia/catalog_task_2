class Attendance < ApplicationRecord
    belongs_to :user
    has_many :logs, through: :user
    validates :attendance_time, presence: true

    def start_time
        self.attendance_time #self.の後はsimple_calendarに表示させるためのカラムを指定
      end

   
   
end
