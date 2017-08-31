class JavascriptStatusesController < ApplicationController
  
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
  
end