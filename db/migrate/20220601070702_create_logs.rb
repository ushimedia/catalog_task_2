class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.datetime :log_attendance_time
      t.datetime :log_leave_time
      t.integer :log_number


      t.timestamps
    end
  end
end
