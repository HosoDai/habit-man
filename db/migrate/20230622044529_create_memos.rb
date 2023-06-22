class CreateMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :memos do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :group, index: true, foreign_key: true
      t.string :reason
      t.integer :attendance_status, null: false, default: 0

      t.timestamps
    end
  end
end
