class PagesController < ApplicationController
  def home
    if current_user
      @recently_played = current_user.logs
    end
  end
end
