class PortfolioCommentsController < ApplicationController

  
  def index
    @comments = Comment.all
    @comment = Comment.find_by(id: params[:id])
  end
  
  def new
  end

  def create
    @comment = Comment.new(content: params[:content])
    @comment.save
    flash[:success] = "投稿されました！"
    redirect_to("/portfolio")
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
