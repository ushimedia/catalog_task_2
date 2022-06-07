class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.date :attendance_date
      t.datetime :attendance_time
      t.datetime :leave_office_time
      t.datetime :log_attendance_time
      t.datetime :log_leave_time
      
      t.timestamps
    end
  end
end
