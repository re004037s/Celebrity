class AttendancesController < ApplicationController
  
  def reply
    @attendances_event_user = User.where(status: true)
    @attendance = Attendance.new(attendances_params)
    if @attendance.save
      flash[:success] = "出席情報が送信されました"
      redirect_to event_path
    else
      flash[:danger] = "送信に失敗しました"
      redirect_to event_path
    end
  end
  
  
  
  private
    def attendances_params
      params.require(:attendance).permit(:status,:user_id,:event_id)
    end
end
