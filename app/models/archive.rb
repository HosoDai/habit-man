class Archive < ApplicationRecord
  # アソシエーションを記述
  belongs_to :user
  belongs_to :group

  # タグ付け機能
  acts_as_taggable_on :tags

  # uploaderを読み込ませる
  mount_uploader :memo_file, ArchiveFileUploader
end
