# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  id_from_spotify        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  spotify_info           :jsonb
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # TODO refresh_credentials -> use refresh token to get new tokens
  # do this when logging in
  has_many :logs

  def log_recently_played
    user = RSpotify::User.new(spotify_info)
    tracks = user.recently_played(limit: 50)
    tracks.each do |track|
      t = Track.find_or_create_by(
        name: track.name,
        album_name: track.album.name,
        image: track.album.images[0]["url"],
        url: track.external_urls["spotify"]
      )
      l = logs.find_or_create_by(
        track: t,
        played_at: DateTime.parse(track.played_at)
      )
      l.update(json: track)
    end
    logs
  end
end
