class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the セレブエンジニアサロン'
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'ユーザ情報を更新しました'
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).update_attribute(:existence, false)
    flash[:success] = 'ユーザを削除しました'
    redirect_to users_path
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :portfolio_path)
    end
    
end
