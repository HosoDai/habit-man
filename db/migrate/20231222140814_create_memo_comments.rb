class CreateMemoComments < ActiveRecord::Migration[7.0]
  def change
    create_table :memo_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :memo_id

      t.timestamps
    end
  end
end
