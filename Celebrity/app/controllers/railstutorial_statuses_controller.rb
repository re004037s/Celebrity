class RailstutorialStatusesController < ApplicationController
  before_action :correct_user_for_edit, only:[:update_schedule]
  before_action :check_guest_user
  
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

    if @course == 'chapter1'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter1: true, chapter1_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter1: false, chapter1_compd: nil)
      end
    end
    if @course == 'chapter2'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter2: true, chapter2_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter2: false, chapter2_compd: nil)
      end
    end
    if @course == 'chapter3'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter3: true, chapter3_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter3: false, chapter3_compd: nil)
      end
    end
    if @course == 'chapter4'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter4: true, chapter4_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter4: false, chapter4_compd: nil)
      end
    end
    if @course == 'chapter5'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter5: true, chapter5_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter5: false, chapter5_compd: nil)
      end
    end
    if @course == 'chapter6'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter6: true, chapter6_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter6: false, chapter6_compd: nil)
      end
    end
    if @course == 'chapter7'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter7: true, chapter7_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter7: false, chapter7_compd: nil)
      end
    end
    if @course == 'chapter8'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter8: true, chapter8_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter8: false, chapter8_compd: nil)
      end
    end
    if @course == 'chapter9'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter9: true, chapter9_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter9: false, chapter9_compd: nil)
      end
    end
    if @course == 'chapter10'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter10: true, chapter10_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter10: false, chapter10_compd: nil)
      end
    end
    if @course == 'chapter11'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter11: true, chapter11_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter11: false, chapter11_compd: nil)
      end
    end
    if @course == 'chapter12'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter12: true, chapter12_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter12: false, chapter12_compd: nil)
      end
    end
    if @course == 'chapter13'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter13: true, chapter13_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter13: false, chapter13_compd: nil)
      end
    end
    if @course == 'chapter14'
      if @status == 'false'
        @railstutorial_status.update_attributes(chapter14: true, chapter14_compd: @today)
      else
        @railstutorial_status.update_attributes(chapter14: false, chapter14_compd: nil)
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