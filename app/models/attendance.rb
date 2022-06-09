class Attendance < ApplicationRecord
    belongs_to :user
    validates :attendance_date, presence: true, uniqueness: { scope: :user_id }
    validate :valid_eligiblity_range?, on: :create
    validate :start_end_check, on: :update
    def start_time
        self.attendance_date #self.の後はsimple_calendarに表示させるためのカラムを指定
      end

    def valid_eligiblity_range?
        return unless leave_office_time? && attendance_time?
    
        if !leave_office_time.after?(attendance_time)
          errors.add(:leave_office_time, "の時間を正しく記入してください。")
        end
    end


    def start_end_check
        errors.add(:leave_office_time, "の時間を正しく記入してください。") unless
        self.attendance_time < self.leave_office_time
      end

    def self.import(file, current)
        CSV.foreach(file.path, headers: true) do |row|
            @attendance = find_or_initialize_by(attendance_date: row[1], user_id: current)
            if @attendance.new_record? 
              @attendance.save!(attendance_date: Date.today, user_id: current, validate: false)
            end
          
       if row[3] == '7001'
        @attendance.log_attendance_time = row[1]
      elsif row[3] == '7002'
        @attendance.log_leave_time = row[1]
       else
      
       end  
            @attendance.save!(validate: false)
        end
      
      
      end
     
end
