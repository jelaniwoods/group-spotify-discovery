class PagesController < ApplicationController
  def home
    if current_user
      @recently_played = current_user.log_recently_played
    end
  end
end
