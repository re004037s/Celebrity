class HtmlCssStatusesController < ApplicationController
  before_action :progate_check
  before_action :correct_user_for_edit, only:[:update_schedule, :update_completion]
  
  def update_schedule
    @schedule_date = params[:date]
    if @schedule_date == ""
      flash[:danger] = "完了予定日がブランクです。完了予定日を選択してください"
      redirect_to current_user
    else
      @status = current_user.html_css_status
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
      @course = params[:html_css_status][:course]
      @status = current_user.html_css_status
      if @course == 'html_css_ga_beginner'
        @status.update_attributes(ga_beginner_completion: @completion_date)
      end
      if @course == 'html_css_ga_middle'
        @status.update_attributes(ga_middle_completion: @completion_date)
      end
      if @course == 'html_css_ga_advanced'
        @status.update_attributes(ga_advanced_completion: @completion_date)
      end
      if @course == 'html_css_do_beginner'
        @status.update_attributes(do_beginner_completion: @completion_date)
      end
      if @course == 'html_css_do_middle'
        @status.update_attributes(do_middle_completion: @completion_date)
      end
      if @course == 'html_css_do_advanced'
        @status.update_attributes(do_advanced_completion: @completion_date)
      end
      if @course == 'html_css_ji_1'
        @status.update_attributes(ji_1_completion: @completion_date)
      end
      if @course == 'html_css_ji_2'
        @status.update_attributes(ji_2_completion: @completion_date)
      end
      flash[:info] = "完了予定日を #{params[:date]} に設定しました"
      redirect_to current_user
    end
  end
  
  def update
    require 'date'
    @html_css_status = current_user.html_css_status
    @today = Date.today
    @course = params[:course]
    @status = params[:status]

    if @course == 'html_css_ga_be'
      if @status == 'false'
        @html_css_status.update_attributes(ga_beginner: true, ga_beginner_compd: @today)
      else
        @html_css_status.update_attributes(ga_beginner: false, ga_beginner_compd: nil)
      end
    end

    if @course == 'html_css_ga_mi'
      if @status == 'false'
        @html_css_status.update_attributes(ga_middle: true, ga_middle_compd: @today)
      else
        @html_css_status.update_attributes(ga_middle: false, ga_middle_compd: nil)
      end
    end

    if @course == 'html_css_ga_ad'
      if @status == 'false'
        @html_css_status.update_attributes(ga_advanced: true, ga_advanced_compd: @today)
      else
        @html_css_status.update_attributes(ga_advanced: false, ga_advanced_compd: nil)
      end
    end

    if @course == 'html_css_do_be'
      if @status == 'false'
        @html_css_status.update_attributes(do_beginner: true, do_beginner_compd: @today)
      else
        @html_css_status.update_attributes(do_beginner: false, do_beginner_compd: nil)
      end
    end

    if @course == 'html_css_do_mi'
      if @status == 'false'
        @html_css_status.update_attributes(do_middle: true, do_middle_compd: @today)
      else
        @html_css_status.update_attributes(do_middle: false, do_middle_compd: nil)
      end
    end

    if @course == 'html_css_do_ad'
      if @status == 'false'
        @html_css_status.update_attributes(do_advanced: true, do_advanced_compd: @today)
      else
        @html_css_status.update_attributes(do_advanced: false, do_advanced_compd: nil)
      end
    end

    if @course == 'html_css_ji_1'
      if @status == 'false'
        @html_css_status.update_attributes(ji_1: true, ji_1_compd: @today)
      else
        @html_css_status.update_attributes(ji_1: false, ji_1_compd: nil)
      end
    end

    if @course == 'html_css_ji_2'
      if @status == 'false'
        @html_css_status.update_attributes(ji_2: true, ji_2_compd: @today)
      else
        @html_css_status.update_attributes(ji_2: false, ji_2_compd: nil)
      end
    end
  end
  
  private
  
    def progate_check
      if current_user.javascript_status.do_1 \
        && current_user.ruby_status.ga_5 \
        && current_user.rubyonrails_status.do_4
          @progate_comp_flag = true
      else
          @progate_comp_flag = false
      end
    end
    
    #adminがedit,updateをするのを制限する 
    def correct_user_for_edit
      @user = User.find(params[:html_css_status][:id])
      if current_user?(@user)
      else
        flash[:danger] = "アドミンは一般ユーザーの個別情報を編集できません"
        redirect_to root_url 
      end
    end
end