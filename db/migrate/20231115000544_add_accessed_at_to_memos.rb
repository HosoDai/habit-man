class AddAccessedAtToMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :memos, :accessed_at, :datetime
  end
end
