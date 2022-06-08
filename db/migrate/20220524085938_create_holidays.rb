class CreateHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :holidays do |t|
      t.date :paid_holiday, null: false
      t.boolean :result, null: false, default: 0
      t.bigint :approver
      t.references :employee, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
