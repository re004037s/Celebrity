class PortfolioCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :check_guest_user
  
  def portfolio
    @user_id =  params[:id]
    @comments = Comment.where(user_page_id: @user_id).page(params[:page])
  end
  
  def index
  end
  
  def new
  end

  def create
    @comment = Comment.new(content: params[:content], user_id: @current_user.id, user_page_id: params[:user_page_id])
    if @comment.save
    flash[:success] = "投稿されました！"
    redirect_to portfolio_path(id: params[:user_page_id])
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:success] = "投稿を削除しました！"
    redirect_to portfolio_path(id: params[:user_page_id])
  end

end
