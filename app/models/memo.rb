class Memo < ApplicationRecord
  # アソシエーションを記述
  belongs_to :user
  belongs_to :group

  # enumを列挙
  enum attendance_status: { attendance: 0, absence: 1, lateness: 2}
end
