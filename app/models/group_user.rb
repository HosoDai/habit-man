class GroupUser < ApplicationRecord
  # アソシエーションを記述
  belongs_to :user
  belongs_to :group
end
