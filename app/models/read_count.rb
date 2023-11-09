class ReadCount < ApplicationRecord
  # このモデルは既読回数を表すモデル(ユーザーは1つのメモに対して1回の既読を許す)

  # バリデーションを記述
  belongs_to :user
  belongs_to :memo
end
