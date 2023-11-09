class CreateArchives < ActiveRecord::Migration[7.0]
  def change
    create_table :archives do |t|
      t.string :title
      t.text :description
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :group, index: true, foreign_key: true
      t.date :memo_date
      t.string :memo_file

      t.timestamps
    end
  end
end
