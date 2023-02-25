class PagesController < ApplicationController
  def home
    if current_user
      @recently_played_logs = current_user.logs.joins(:track).where(played_at: 1.week.ago..).page(params[:page])
    end
  end
end
