class UserMovieStatusesController < ApplicationController
  before_action :correct_user_for_edit, only:[:update_schedule]
  
  def update_schedule
    @schedule_date = params[:date]
    @user_movie_status = current_user.user_movie_status
    @user_movie_status.update_attributes(schedule_date: @schedule_date)
    redirect_to current_user
  end
  private
    #adminがedit,updateをするのを制限する 
    def correct_user_for_edit
      @user = User.find(params[:user_movie_status][:id])
      if current_user?(@user)
        flash[:info] = "完了予定日を #{params[:date]} に設定しました"
      else
        flash[:danger] = "アドミンは一般ユーザーの個別情報を編集できません"
        redirect_to root_url 
      end
    end
  
end
