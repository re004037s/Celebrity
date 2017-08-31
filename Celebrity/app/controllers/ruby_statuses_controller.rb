class RubyStatusesController < ApplicationController
  
  def update
    require 'date'
    @ruby_status = current_user.ruby_status
    @today = Date.today
    @course = params[:course]
    @status = params[:status]

    if @course == 'ruby_ga_1'
      if @status == 'false'
        @ruby_status.update_attributes(ga_1: true, ga_1_compd: @today)
      else
        @ruby_status.update_attributes(ga_1: false, ga_1_compd: nil)
      end
    end

    if @course == 'ruby_ga_2'
      if @status == 'false'
        @ruby_status.update_attributes(ga_2: true, ga_2_compd: @today)
      else
        @ruby_status.update_attributes(ga_2: false, ga_2_compd: nil)
      end
    end

    if @course == 'ruby_ga_3'
      if @status == 'false'
        @ruby_status.update_attributes(ga_3: true, ga_3_compd: @today)
      else
        @ruby_status.update_attributes(ga_3: false, ga_3_compd: nil)
      end
    end

    if @course == 'ruby_ga_4'
      if @status == 'false'
        @ruby_status.update_attributes(ga_4: true, ga_4_compd: @today)
      else
        @ruby_status.update_attributes(ga_4: false, ga_4_compd: nil)
      end
    end

    if @course == 'ruby_ga_5'
      if @status == 'false'
        @ruby_status.update_attributes(ga_5: true, ga_5_compd: @today)
      else
        @ruby_status.update_attributes(ga_5: false, ga_5_compd: nil)
      end
    end
  end
end