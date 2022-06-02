class Log < ApplicationRecord
    belongs_to :user
  #  has_many :attendances, through: :user
    def start_time
        self.log_time #self.の後はsimple_calendarに表示させるためのカラムを指定
      end

  
end
