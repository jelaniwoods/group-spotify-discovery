# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  album_name :string
#  image      :string
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Track < ApplicationRecord
end
