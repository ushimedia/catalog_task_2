class Attendance < ApplicationRecord
    belongs_to :user
    has_many :logs, through: :user
    validates :attendance_date, presence: true, uniqueness: { scope: :user_id }
  #  validate :start_end_check

    def start_time
        self.attendance_date #self.の後はsimple_calendarに表示させるためのカラムを指定
      end
  #  def start_end_check
   #     errors.add(:leave_office_time, "の日付を正しく記入してください。") unless
   #     self.attendance_time < self.leave_office_time
   #   end

      def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            @attendance = find_or_initialize_by(attendance_date: row[1])
            if @attendance.new_record? 
              @attendance.save(attendance_date: Date.today)
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
      

   CSV_HEADER = {
    '日付と時刻' => 'log_attendance_time',
  # 'イベント ID' => 'status'
  }.freeze
end
