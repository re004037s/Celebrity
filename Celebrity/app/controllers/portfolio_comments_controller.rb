class PortfolioCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def index
    @comments = Comment.all
    @comment = Comment.find_by(id: params[:id])
  end
  
  def new
  end

  def create
    @comment = Comment.new(content: params[:content], user_id: @current_user.id)
    if @comment.save
    flash[:success] = "投稿されました！"
    redirect_to("/portfolio")
    end
  end
  


  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:success] = "投稿を削除しました！"
    redirect_to("/portfolio")
  end
  
  def portfolio
    @comments = Comment.all
    @comment = Comment.find_by(id: params[:id])
  end


end
