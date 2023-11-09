class ViewCount < ApplicationRecord
  # このモデルは回数制限なく閲覧回数を表すモデル(ユーザーは1つのメモに対して何回でも既読を許す)

  # バリデーションを記述
  belongs_to :user
  belongs_to :memo
end
