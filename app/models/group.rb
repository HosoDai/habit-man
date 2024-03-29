class Group < ApplicationRecord
  # アソシエーションを記述
  has_many :group_users
  has_many :users, through: :group_users
  has_many :memos, dependent: :destroy
  has_many :archives, dependent: :destroy

  # バリデーションを記述
  validates :name, presence: true, length: { maximum: 50 }

  # uploaderを読み込ませる
  mount_uploader :image, ImageUploader
end
