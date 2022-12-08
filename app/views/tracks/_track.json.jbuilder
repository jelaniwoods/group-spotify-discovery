json.extract! track, :id, :name, :image, :album_name, :url, :created_at, :updated_at
json.url track_url(track, format: :json)
