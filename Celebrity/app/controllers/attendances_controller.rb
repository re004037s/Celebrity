class AttendancesController < ApplicationController
  def create
   @eventpost = Event.find(params[:event_id])
   @eventpost.attendances.create(attendance_params)
   @attendance_users = User.page(params[:page]).select{ |u| u.existence == true && u.status == true }
   redirect_to events_path(@eventpost)
  end
  
  
  private
  
  def attendance_params
    params.require(:sttendance).permit(:status)
  end
  
end
