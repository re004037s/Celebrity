class RailstutorialStatusesController < ApplicationController
  before_action :correct_user_for_edit, only:[:update_schedule]
  
  def update_schedule
    @schedule_date = params[:date]
    if @schedule_date == ""
      flash[:danger] = "完了予定日がブランクです。完了予定日を選択してください"
      redirect_to current_user
    else
      @status = current_user.railstutorial_status
      @status.update_attributes(schedule_date: @schedule_date)
      flash[:info] = "完了予定日を #{params[:date]} に設定しました"
      redirect_to current_user
    end
  end
  
  def update
    require 'date'
    @railstutorial_status = current_user.railstutorial_status
      @today = Date.today
    @course = params[:course]
    @status = params[:status]

    n_arr = [*1..14]
    
    n_arr.each do |n|
      
      chapter = 'chapter' << n
      args_true  = {"#{chapter}": true,  "#{chapter}_compd": @today}
      args_false = {"#{chapter}": false, "#{chapter}_compd": nil}
      
      if @course == chapter
        if @status == 'false'
          @railstutorial_status.update_attributes(**args_true)
        else
          @railstutorial_status.update_attributes(**args_false)
        end
      end
    end
  end
  
  private
    #adminがedit,updateをするのを制限する 
    def correct_user_for_edit
      @user = User.find(params[:railstutorial_status][:id])
      if current_user?(@user)
      else
        flash[:danger] = "アドミンは一般ユーザーの個別情報を編集できません"
        redirect_to root_url 
      end
    end
  
  
end