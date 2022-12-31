# == Schema Information
#
# Table name: logs
#
#  id         :bigint           not null, primary key
#  played_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  track_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_logs_on_track_id  (track_id)
#  index_logs_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (track_id => tracks.id)
#  fk_rails_...  (user_id => users.id)
#
class Log < ApplicationRecord
  belongs_to :track
  belongs_to :user
end
