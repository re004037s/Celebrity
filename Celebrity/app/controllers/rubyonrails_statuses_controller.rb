class RubyonrailsStatusesController < ApplicationController
   before_action :progate_check
   before_action :correct_user_for_edit, only:[:update_schedule, :update_completion]

  def update_schedule
    @schedule_date = params[:date]
    if @schedule_date == ""
      flash[:danger] = "完了予定日がブランクです。完了予定日を選択してください"
      redirect_to current_user
    else
      @status = current_user.rubyonrails_status
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
      @course = params[:rubyonrails_status][:course]
      @status = current_user.rubyonrails_status
      if @course == 'rubyonrails_ga_1'
        @status.update_attributes(ga_1_completion: @completion_date)
      end
      if @course == 'rubyonrails_ga_2'
        @status.update_attributes(ga_2_completion: @completion_date)
      end
      if @course == 'rubyonrails_ga_3'
        @status.update_attributes(ga_3_completion: @completion_date)
      end
      if @course == 'rubyonrails_ga_4'
        @status.update_attributes(ga_4_completion: @completion_date)
      end
      if @course == 'rubyonrails_ga_5'
        @status.update_attributes(ga_5_completion: @completion_date)
      end
      if @course == 'rubyonrails_ga_6'
        @status.update_attributes(ga_6_completion: @completion_date)
      end
      if @course == 'rubyonrails_ga_7'
        @status.update_attributes(ga_7_completion: @completion_date)
      end
      if @course == 'rubyonrails_ga_8'
        @status.update_attributes(ga_8_completion: @completion_date)
      end
      if @course == 'rubyonrails_ga_9'
        @status.update_attributes(ga_9_completion: @completion_date)
      end
      if @course == 'rubyonrails_ga_10'
        @status.update_attributes(ga_10_completion: @completion_date)
      end
      if @course == 'rubyonrails_ga_11'
        @status.update_attributes(ga_11_completion: @completion_date)
      end
      if @course == 'rubyonrails_do_1'
        @status.update_attributes(do_1_completion: @completion_date)
      end
      if @course == 'rubyonrails_do_2'
        @status.update_attributes(do_2_completion: @completion_date)
      end
      if @course == 'rubyonrails_do_3'
        @status.update_attributes(do_3_completion: @completion_date)
      end
      if @course == 'rubyonrails_do_4'
        @status.update_attributes(do_4_completion: @completion_date)
      end
      flash[:info] = "完了予定日を #{params[:date]} に設定しました"
      redirect_to current_user
    end
  end

  def update
    require 'date'
    @rubyonrails_status = current_user.rubyonrails_status
    @today = Date.today
    @course = params[:course]
    @status = params[:status]

    if @course == 'rubyonrails_ga_1'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_1: true, ga_1_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_1: false, ga_1_compd: nil)
      end
    end

    if @course == 'rubyonrails_ga_2'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_2: true, ga_2_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_2: false, ga_2_compd: nil)
      end
    end

    if @course == 'rubyonrails_ga_3'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_3: true, ga_3_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_3: false, ga_3_compd: nil)
      end
    end

    if @course == 'rubyonrails_ga_4'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_4: true, ga_4_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_4: false, ga_4_compd: nil)
      end
    end

    if @course == 'rubyonrails_ga_5'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_5: true, ga_5_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_5: false, ga_5_compd: nil)
      end
    end

    if @course == 'rubyonrails_ga_6'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_6: true, ga_6_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_6: false, ga_6_compd: nil)
      end
    end

    if @course == 'rubyonrails_ga_7'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_7: true, ga_7_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_7: false, ga_7_compd: nil)
      end
    end

    if @course == 'rubyonrails_ga_8'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_8: true, ga_8_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_8: false, ga_8_compd: nil)
      end
    end

    if @course == 'rubyonrails_ga_9'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_9: true, ga_9_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_9: false, ga_9_compd: nil)
      end
    end

    if @course == 'rubyonrails_ga_10'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_10: true, ga_10_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_10: false, ga_10_compd: nil)
      end
    end

    if @course == 'rubyonrails_ga_11'
      if @status == 'false'
        @rubyonrails_status.update_attributes(ga_11: true, ga_11_compd: @today)
      else
        @rubyonrails_status.update_attributes(ga_11: false, ga_11_compd: nil)
      end
    end

    if @course == 'rubyonrails_do_1'
      if @status == 'false'
        @rubyonrails_status.update_attributes(do_1: true, do_1_compd: @today)
      else
        @rubyonrails_status.update_attributes(do_1: false, do_1_compd: nil)
      end
    end

    if @course == 'rubyonrails_do_2'
      if @status == 'false'
        @rubyonrails_status.update_attributes(do_2: true, do_2_compd: @today)
      else
        @rubyonrails_status.update_attributes(do_2: false, do_2_compd: nil)
      end
    end

    if @course == 'rubyonrails_do_3'
      if @status == 'false'
        @rubyonrails_status.update_attributes(do_3: true, do_3_compd: @today)
      else
        @rubyonrails_status.update_attributes(do_3: false, do_3_compd: nil)
      end
    end

    if @course == 'rubyonrails_do_4'
      if @status == 'false'
        @rubyonrails_status.update_attributes(do_4: true, do_4_compd: @today)
      else
        @rubyonrails_status.update_attributes(do_4: false, do_4_compd: nil)
      end
    end
  end
  
  private
    
    def progate_check
      if current_user.html_css_status.ji_2 \
        && current_user.javascript_status.do_1 \
        && current_user.ruby_status.ga_5
          @progate_comp_flag = true
      else
          @progate_comp_flag = false
      end
    end
    
    #adminがedit,updateをするのを制限する 
    def correct_user_for_edit
      @user = User.find(params[:rubyonrails_status][:id])
      if current_user?(@user)
      else
        flash[:danger] = "アドミンは一般ユーザーの個別情報を編集できません"
        redirect_to root_url 
      end
    end
    
    
end