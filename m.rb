require "json"
require "date"
file = open("m.json").read
json = JSON.parse(file)

items = json["items"]
items.each do |item|
  puts item["track"]["name"] + " - " + item["track"]["album"]["name"]
  puts item["track"]["external_urls"]["spotify"]
  puts item["played_at"]
  puts DateTime.parse(item["played_at"])
  puts "____________"
end
