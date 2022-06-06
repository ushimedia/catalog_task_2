class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.date :attendance_date
      t.time :attendance_time, null: false
      t.time :leave_office_time
    
      
      t.timestamps
    end
  end
end
