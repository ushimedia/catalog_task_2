class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.date :log_date
      t.datetime :log_time
      t.integer :status


      t.timestamps
    end
  end
end
