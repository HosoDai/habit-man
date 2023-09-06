class Memo < ApplicationRecord
  # アソシエーションを記述
  belongs_to :user
  belongs_to :group

  # バリデーションを記述
  validates :title, presence: true
  validates :description, presence: true

  # タグ付け機能
  acts_as_taggable_on :tags

  # uploaderを読み込ませる
  mount_uploader :memo_file, MemoFileUploader

end
