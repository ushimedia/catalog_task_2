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
            @attendance = find_by(attendance_date: row['日付と時刻']) || new

            row_hash = row.to_hash.slice(*CSV_HEADER.keys)
         


          @attendance.attributes = row_hash.transform_keys(&CSV_HEADER.method(:[]))

        


            
            @attendance.save!(validate: false)
          
          
       
      
      end
      

 #  CSV_HEADER = {
 #   '日付と時刻' => 'attendance_date',
 #  'イベント ID' => 'status'
 # }.freeze
end
end
