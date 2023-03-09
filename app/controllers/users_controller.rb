class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  def spotify
    spotify_user = RSpotify::User.new(request.env.fetch("omniauth.auth"))
    password = "password"
    user = User.where(email: spotify_user.email)
      .first_or_create(
        username: spotify_user.display_name,
        id_from_spotify: spotify_user.id,
        password: password,
        spotify_info: spotify_user.to_hash,
      )
    sign_in user
    redirect_to root_path, notice: "Signed in successfully!"
  end

  def index
    users = User.all
    render json: users.to_json
  end
end
