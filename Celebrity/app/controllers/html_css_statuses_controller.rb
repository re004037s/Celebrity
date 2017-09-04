class HtmlCssStatusesController < ApplicationController
  
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

    # respond_to do |format|
    #   format.html { redirect_to current_user }
    #   format.js
    # end
  end
end