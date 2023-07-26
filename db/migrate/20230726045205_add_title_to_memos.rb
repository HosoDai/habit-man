class AddTitleToMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :memos, :title, :string
  end
end
