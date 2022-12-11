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
      logs.find_or_create_by(
        track: t,
        played_at: DateTime.parse(track.played_at)
      )
    end
    logs
  end
end
