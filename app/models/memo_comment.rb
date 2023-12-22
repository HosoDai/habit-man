class MemoComment < ApplicationRecord
  # アソシエーションを記述
  belongs_to :user
  belongs_to :memo

  # バリデーションを記述
  validates :comment, presence: true
end
