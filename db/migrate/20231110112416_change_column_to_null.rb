class ChangeColumnToNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :memos, :accessed_at, true
  end
end
