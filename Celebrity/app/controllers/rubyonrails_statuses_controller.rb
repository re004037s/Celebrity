class RubyonrailsStatusesController < ApplicationController
   before_action :progate_check

  def update_schedule
    @schedule_date = params[:date]
    @rubyonrails_status = current_user.rubyonrails_status
    @rubyonrails_status.update_attributes(schedule_date: @schedule_date)
    redirect_to current_user
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
        && current_user.javascript_status.ga_4 \
        && current_user.ruby_status.ga_5
          @progate_comp_flag = true
      else
          @progate_comp_flag = false
      end
    end
end