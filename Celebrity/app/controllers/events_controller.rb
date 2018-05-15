class EventsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :edit, :destroy]
  
  def index
    @eventposts = Event.all.page(params[:page])
  end

  def show
    @attendance_users = Attendance.page(params[:page]).select{ |u| u.existence == true && u.status == true }
    @eventpost = Event.find(params[:id])
  end

  def new
    @eventpost = Event.new
  end
  
  def create
    @eventpost = current_user.events.build(eventposts_params)
    if @eventpost.save
      flash[:success] = "イベントが投稿されました"
      redirect_to events_path
    else
      flash[:danger] = "投稿に失敗しました"
      render 'new'
    end
  end
  
  def edit
    @eventpost = Event.find(params[:id])
  end
  
  def update
    @eventpost = Event.find(params[:id])
    if @eventpost.update_attributes(eventposts_params)
      flash[:success] = "イベント内容が更新されました"
      redirect_to events_path
    else
      render 'edit'
    end
  end
  

  def destroy
    @eventpost = Event.find(params[:id])
    @eventpost.destroy
    flash[:success] = "イベント内容が削除されました"
    redirect_to events_path
  end
  
  private

    def eventposts_params
      params.require(:event).permit(:title, :date, :text, :picture, :free, :venture, :status)

    end
end
  
