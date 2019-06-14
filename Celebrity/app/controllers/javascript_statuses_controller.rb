class JavascriptStatusesController < ApplicationController
  before_action :progate_check
  before_action :correct_user_for_edit, only:[:update_schedule, :update_completion]
  
  def update_schedule
    @schedule_date = params[:date]
    if @schedule_date == ""
      flash[:danger] = "完了予定日がブランクです。完了予定日を選択してください"
      redirect_to current_user
    else
      @status = current_user.javascript_status
      @status.update_attributes(schedule_date: @schedule_date)
      flash[:info] = "完了予定日を #{params[:date]} に設定しました"
      redirect_to current_user
    end
  end

  # 完了予定日の更新
  def update_completion
    @completion_date = params[:date]
    if @completion_date == ""
      flash[:danger] = "完了予定日がブランクです。完了予定日を選択してください"
      redirect_to current_user
    else
      @course = params[:javascript_status][:course]
      @status = current_user.javascript_status
      if @course == 'javascript_ga_1'
        @status.update_attributes(ga_1_completion: @completion_date)
      end
      if @course == 'javascript_ga_2'
        @status.update_attributes(ga_2_completion: @completion_date)
      end
      if @course == 'javascript_ga_3'
        @status.update_attributes(ga_3_completion: @completion_date)
      end
      if @course == 'javascript_ga_4'
        @status.update_attributes(ga_4_completion: @completion_date)
      end
      if @course == 'javascript_do_1'
        @status.update_attributes(do_1_completion: @completion_date)
      end
      flash[:info] = "完了予定日を #{params[:date]} に設定しました"
      redirect_to current_user
    end
  end
  
  
  def update
    require 'date'
    @javascript_status = current_user.javascript_status
    @today = Date.today
    @course = params[:course]
    @status = params[:status]
    
    if @course == 'javascript_ga_1'
      if @status == 'false'
        @javascript_status.update_attributes(ga_1: true, ga_1_compd: @today)
      else
        @javascript_status.update_attributes(ga_1: false, ga_1_compd: nil)
      end
    end

    if @course == 'javascript_ga_2'
      if @status == 'false'
        @javascript_status.update_attributes(ga_2: true, ga_2_compd: @today)
      else
        @javascript_status.update_attributes(ga_2: false, ga_2_compd: nil)
      end
    end 
    
    if @course == 'javascript_ga_3'
      if @status == 'false'
        @javascript_status.update_attributes(ga_3: true, ga_3_compd: @today)
      else
        @javascript_status.update_attributes(ga_3: false, ga_3_compd: nil)
      end
    end 
    
    if @course == 'javascript_ga_4'
      if @status == 'false'
        @javascript_status.update_attributes(ga_4: true, ga_4_compd: @today)
      else
        @javascript_status.update_attributes(ga_4: false, ga_4_compd: nil)
      end
    end 
    
    if @course == 'javascript_do_1'
      if @status == 'false'
        @javascript_status.update_attributes(do_1: true, do_1_compd: @today)
      else
        @javascript_status.update_attributes(do_1: false, do_1_compd: nil)
      end
    end 
  end
  
  private
  
    def progate_check
      if current_user.html_css_status.ji_2 \
        && current_user.javascript_status.do_1 \
        && current_user.ruby_status.ga_5 \
        && current_user.rubyonrails_status.do_4 \
        && current_user.bootstrap_status.ga2
          @progate_comp_flag = true
      else
          @progate_comp_flag = false
      end
    end
    
    #adminがedit,updateをするのを制限する 
    def correct_user_for_edit
      @user = User.find(params[:javascript_status][:id])
      if current_user?(@user)
      else
        flash[:danger] = "アドミンは一般ユーザーの個別情報を編集できません"
        redirect_to root_url 
      end
    end
    
end