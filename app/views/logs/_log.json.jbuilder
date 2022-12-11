json.extract! log, :id, :track_id, :user_id, :played_at, :created_at, :updated_at
json.url log_url(log, format: :json)
