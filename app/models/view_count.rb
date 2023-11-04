class ViewCount < ApplicationRecord

  # バリデーションを記述
  belongs_to :user
  belongs_to :memo
end
