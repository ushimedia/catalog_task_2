class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.datetime :log_time
      t.integer :log_number
      t.integer :status


      t.timestamps
    end
  end
end
