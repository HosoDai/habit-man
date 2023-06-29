class AddMemoDateToMemo < ActiveRecord::Migration[7.0]
  def change
    add_column :memos, :memo_date, :date
  end
end
