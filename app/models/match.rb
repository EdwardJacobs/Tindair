class Match < ApplicationRecord
  validates_uniqueness_of :user_1, scope: :user_2

  scope :matches_for, -> id do
    matches = where("(user_1 = ? OR user_2 = ?) AND (user_1_approves = ? AND user_2_approves = ?)", id, id, true, true)

    user_ids = []
    matches.each do |match|
      new_id = match.user_1 == id ? match.user_2 : match.user_1
      user_ids << new_id
    end

    User.where(id: user_ids)
  end

end
