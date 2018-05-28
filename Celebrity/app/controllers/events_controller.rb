class EventsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :edit, :destroy]
  
  def index
    if current_user.try(:admin)
      @eventposts = Event.all.page(params[:page])
    else
      if current_user.free_engineer_user && current_user.venture_user
        @eventposts = Event.all.page(params[:page])
      elsif current_user.free_engineer_user
        @eventposts = Event.where(free: true).page(params[:page])
      elsif current_user.venture_user
        @eventposts = Event.where(venture: true).page(params[:page])
      end
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
    if @eventpost.free && @eventpost.venture
      @user = User.all
      if @eventpost.save
        EventMailer.send_when_create(@user, @eventpost).deliver
        flash[:success] = "イベントが投稿されました"
        redirect_to events_path
      else
        flash[:danger] = "投稿に失敗しました"
        render 'new'
      end
    elsif @eventpost.free
      @user = User.where(free_engineer_user: true)
      if @eventpost.save
        EventMailer.send_when_create(@user, @eventpost).deliver
        flash[:success] = "イベントが投稿されました"
        redirect_to events_path
      else
        flash[:danger] = "投稿に失敗しました"
        render 'new'
      end
    elsif @eventpost.venture
      @user = User.where(venture_user: true)
      if @eventpost.save
        EventMailer.send_when_create(@user, @eventpost).deliver
        flash[:success] = "イベントが投稿されました"
        redirect_to events_path
      else
        flash[:danger] = "投稿に失敗しました"
        render 'new'
      end
    end
  end
  
  def edit
    @eventpost = Event.find(params[:id])
  end
  
  def update
    @eventpost = Event.find(params[:id])
    if @eventpost.free && @eventpost.venture
      @user = User.all
      if @eventpost.update_attributes(eventposts_params)
        EventMailer.send_when_update(@user, @eventpost).deliver
        flash[:success] = "イベント内容が更新されました"
        redirect_to events_path
      else
        render 'edit'
      end
    elsif @eventpost.free
      @user = User.where(free_engineer_user: true)
      if @eventpost.update_attributes(eventposts_params)
        EventMailer.send_when_update(@user, @eventpost).deliver
        flash[:success] = "イベント内容が更新されました"
        redirect_to events_path
      else
        render 'edit'
      end
    elsif @eventpost.venture
      @user = User.where(venture_user: true)
      if @eventpost.update_attributes(eventposts_params)
        EventMailer.send_when_update(@user, @eventpost).deliver
        flash[:success] = "イベント内容が更新されました"
        redirect_to events_path
      else
        render 'edit'
      end
    end
  end
  

  def destroy
    @eventpost = Event.find(params[:id])
    if @eventpost.free && @eventpost.venture
      @user = User.all
      @eventpost.destroy
      EventMailer.send_when_destroy(@user, @eventpost).deliver
      flash[:success] = "イベント内容が削除されました"
      redirect_to events_path
    elsif @eventpost.free
      @user = User.where(free_engineer_user: true)
      @eventpost.destroy
      EventMailer.send_when_destroy(@user, @eventpost).deliver
      flash[:success] = "イベント内容が削除されました"
      redirect_to events_path
    elsif @eventpost.venture
      @user = User.where(venture_user: true)
      @eventpost.destroy
      EventMailer.send_when_destroy(@user, @eventpost).deliver
      flash[:success] = "イベント内容が削除されました"
      redirect_to events_path
    end
  end
  
  
  private

    def eventposts_params
      params.require(:event).permit(:id, :title, :date, :text, :picture, :free, :venture, :status)
    end
    
    
end
  
