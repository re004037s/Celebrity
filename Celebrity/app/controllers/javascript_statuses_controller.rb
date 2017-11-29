class JavascriptStatusesController < ApplicationController
  before_action :progate_check
  
  def update_schedule
    @schedule_date = params[:date]
    @javascript_status = current_user.javascript_status
    @javascript_status.update_attributes(schedule_date: @schedule_date)
    redirect_to current_user
  end
  
  def update
    require 'date'
    @javascript_status = current_user.javascript_status
    @today = Date.today
    @course = params[:course]
    @status = params[:status]
    
    if @course == 'javascript_ga_be'
      if @status == 'false'
        @javascript_status.update_attributes(ga_beginner: true, ga_beginner_compd: @today)
      else
        @javascript_status.update_attributes(ga_beginner: false, ga_beginner_compd: nil)
      end
    end

    if @course == 'javascript_do_be'
      if @status == 'false'
        @javascript_status.update_attributes(do_beginner: true, do_beginner_compd: @today)
      else
        @javascript_status.update_attributes(do_beginner: false, do_beginner_compd: nil)
      end
    end 
  end
  
  private
  
    def progate_check
      if current_user.html_css_status.ji_2 \
        && current_user.ruby_status.ga_5 \
        && current_user.rubyonrails_status.do_4
          @progate_comp_flag = true
      else
          @progate_comp_flag = false
      end
    end
end