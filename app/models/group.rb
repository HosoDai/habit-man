class Group < ApplicationRecord
  # アソシエーションを記述
  has_many :group_users
  has_many :users, through: :group_users
  has_many :memos, dependent: :destroy

  # バリデーションを記述
  validates :name, presence: true, length: { maximum: 50 }
end
