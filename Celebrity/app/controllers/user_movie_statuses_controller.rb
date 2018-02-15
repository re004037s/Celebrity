class UserMovieStatusesController < ApplicationController
  before_action :correct_user_for_edit, only:[:update_schedule]
  
  def update_schedule
    @schedule_date = params[:date]
    if @schedule_date == ""
      flash[:danger] = "完了予定日がブランクです。完了予定日を選択してください"
      redirect_to current_user
    else
      @status = current_user.user_movie_status
      @status.update_attributes(schedule_date: @schedule_date)
      flash[:info] = "完了予定日を #{params[:date]} に設定しました"
      redirect_to current_user
    end
  end
  
  private
    #adminがedit,updateをするのを制限する 
    def correct_user_for_edit
      @user = User.find(params[:user_movie_status][:id])
      if current_user?(@user)
      else
        flash[:danger] = "アドミンは一般ユーザーの個別情報を編集できません"
        redirect_to root_url 
      end
    end
  
end
