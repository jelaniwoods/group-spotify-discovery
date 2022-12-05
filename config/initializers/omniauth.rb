require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify,
    ENV.fetch("SPOTIFY_CLIENT_ID"),
    ENV.fetch("SPOTIFY_CLIENT_SECRET"),
    scope: 'user-read-email user-read-recently-played'
end

OmniAuth.config.allowed_request_methods = [:post, :get]
