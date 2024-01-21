class AddKeyToMemo < ActiveRecord::Migration[7.0]
  def change
    add_column :memos, :key, :boolean, default: false, null: false
  end
end
