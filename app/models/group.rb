class Group < ApplicationRecord
  # アソシエーションを記述
  has_many :groupusers
  has_many :users, through: :groupusers

  # バリデーションを記述
  validates :name, presence: true, length: { maximum: 50 }
end
