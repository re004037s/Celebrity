class EventsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :edit, :destroy]
  
  def index
    if current_user.free_engineer_user && current_user.venture_user
      @eventposts = Event.all.page(params[:page])
    elsif current_user.free_engineer_user
      @eventposts = Event.where(free: true).page(params[:page])
    elsif current_user.venture_user
      @eventposts = Event.where(venture: true).page(params[:page])
    end
  end

  def show
    @eventpost = Event.find(params[:id])
    @attendance = Attendance.new
  end

  def new
    @eventpost = Event.new
  end
  
  def create
    @eventpost = Event.new(eventposts_params)
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
  
