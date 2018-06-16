class AttendancesController < ApplicationController
  
  def reply
    if Attendance.where(event_id: params[:id]).where(user_id: current_user.id).count >= 1
      redirect_to update
      else  
     @attendance = Attendance.new(attendances_params)
         if @attendance.save
          flash[:success] = "出席情報が送信されました"
          redirect_to event_path
         else
          flash[:danger] = "送信に失敗しました"
          redirect_to event_path
         end
      end
  end
  
  def update
    @attendance = Attendance.find(event_id: params[:id]).find(user_id: current_user.id)
    # if @attendance.update_attributes(attendances_params)
    #   flash[:success] = "出席情報を更新しました"
    #   redirect_to evenr_path
    # else
    #   flash[:danger] = "出席情報送信に失敗しました"
    #   redirect_to evenr_path
    # end
  end
  
  
  
  private
    def attendances_params
      params.require(:attendance).permit(:status,:user_id,:event_id)
    end
end
