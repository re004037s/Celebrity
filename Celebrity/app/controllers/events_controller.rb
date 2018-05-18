class EventsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :edit, :destroy]
  
  def index
    @eventposts = Event.all.page(params[:page])
  end

  def show
    @eventpost = Event.find(params[:id])
    #@attendances = current_user.events.build(attendances_params)
    #if @attendances.save
     # flash[:success] = "出席情報が送信されました"
     # redirect_to event_path
   # else
    #  flash[:danger] = "送信に失敗しました"
    #  render 'show'
  #  end
    
  end

  def new
    @eventpost = Event.new
  end
  
  def create
    @eventpost = current_user.events.attendances.build(eventposts_params)
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
      params.require(:event).permit(:title, :date, :text, :picture, :free, :venture)
    end
    
    #def attendances_params
      #params.require(:attendance).permit(:status)
    #end
end
  
