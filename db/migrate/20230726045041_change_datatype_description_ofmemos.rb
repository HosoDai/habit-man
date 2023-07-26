class ChangeDatatypeDescriptionOfmemos < ActiveRecord::Migration[7.0]
  def change
    change_column :memos, :description, :text
  end
end
