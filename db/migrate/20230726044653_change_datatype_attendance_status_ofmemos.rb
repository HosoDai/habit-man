class ChangeDatatypeAttendanceStatusOfmemos < ActiveRecord::Migration[7.0]
  def change
    change_column :memos, :attendance_status, :string
  end
end
