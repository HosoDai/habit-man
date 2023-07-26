class RemoveAttendanceStatusFromMemos < ActiveRecord::Migration[7.0]
  def change
    remove_column :memos, :attendance_status, :string
  end
end
