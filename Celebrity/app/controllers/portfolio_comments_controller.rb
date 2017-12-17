class PortfolioCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def index
    @comments = Comment.all.order(created_at: :desc)
  end
  
  def new
  end

  def create
    @comment = Comment.new(content: params[:content])
    @comment.save
    flash[:success] = "Comment saved"
    redirect_to("/portfolio")
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
  end
  
  def portfolio
    @comment = current_user.comments.find_by(id: params[:id])
    @comments = Comment.all.order(created_at: :desc)
  end

  
  private

  def comment_params
      params.require(:comment).permit(:content)
  end
  
  def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
  end
end
