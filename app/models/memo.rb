class Memo < ApplicationRecord
  # アソシエーションを記述
  belongs_to :user
  belongs_to :group

  # バリデーションを記述
  validates :title, presence: true
  validates :description, presence: true

end
