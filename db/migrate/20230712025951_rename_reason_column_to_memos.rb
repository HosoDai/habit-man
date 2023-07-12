class RenameReasonColumnToMemos < ActiveRecord::Migration[7.0]
  def change
    rename_column :memos, :reason, :description
  end
end
