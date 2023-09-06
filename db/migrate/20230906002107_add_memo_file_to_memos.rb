class AddMemoFileToMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :memos, :memo_file, :string
  end
end
