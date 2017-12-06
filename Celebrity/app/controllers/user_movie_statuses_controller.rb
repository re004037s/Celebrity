class UserMovieStatusesController < ApplicationController
  def update_schedule
    @schedule_date = params[:date]
    @user_movie_status = current_user.user_movie_status
    @user_movie_status.update_attributes(schedule_date: @schedule_date)
    redirect_to current_user
  end
end
