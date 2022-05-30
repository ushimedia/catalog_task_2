class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.datetime :attendance_time, null: false
      t.datetime :leave_office_time
    
      
      t.timestamps
    end
  end
end
