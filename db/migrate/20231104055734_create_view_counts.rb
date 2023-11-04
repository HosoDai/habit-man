class CreateViewCounts < ActiveRecord::Migration[7.0]
  def change
    create_table :view_counts do |t|
      t.integer :user_id
      t.integer :memo_id

      t.timestamps
    end
  end
end
