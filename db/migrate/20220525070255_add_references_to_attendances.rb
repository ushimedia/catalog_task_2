class AddReferencesToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_reference :attendances, :user, foreign_key: true
  end
end
