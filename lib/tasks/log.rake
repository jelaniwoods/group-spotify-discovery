namespace :log do
  desc "Log recently played songs"
  task recently_played: :environment do
    User.all.each do |user|
      old_logs_count = user.logs.count
      new_logs_count = user.log_recently_played.count
      puts "#{user.username} - new logs: #{new_logs_count - old_logs_count}"
    end
  end

end
