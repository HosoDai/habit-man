class Memo < ApplicationRecord
  # アソシエーションを記述
  belongs_to :user
  belongs_to :group
  has_many :view_counts, dependent: :destroy
  has_many :read_counts, dependent: :destroy
  has_many :memo_comments, dependent: :destroy

  # バリデーションを記述
  validates :title, presence: true

  # タグ付け機能
  acts_as_taggable_on :tags

  # uploaderを読み込ませる
  mount_uploader :memo_file, MemoFileUploader

end
