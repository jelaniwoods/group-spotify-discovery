# == Schema Information
#
# Table name: memberships
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_memberships_on_group_id  (group_id)
#  index_memberships_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#
class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  validates :user, uniqueness: true
  validate :user_cannot_own_group


  def user_cannot_own_group
    if user.present? && group.user == user
      errors.add(:user, "can't be creator of group")
    end
  end
end
