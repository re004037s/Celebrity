class InterviewPostsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :edit, :destroy]
  before_action :check_guest_user
  
  def index
    @interviewposts = InterviewPost.all.page(params[:page])
  end
  
  def new
    @interviewpost = InterviewPost.new
  end
  
  def create
   @interviewpost = current_user.interview_posts.build(interviewpost_params)
    if @interviewpost.save
      flash[:success] = "面談内容が投稿されました"
      redirect_to interview_posts_path
    else
      render 'new'
    end
  end
  
  def edit
    @interviewpost = InterviewPost.find(params[:id])
  end

  def show
    @interviewpost = InterviewPost.find(params[:id])
  end
  
  def update
    @interviewpost = InterviewPost.find(params[:id])
    if @interviewpost.update_attributes(interviewpost_params)
      flash[:success] = "面談内容が更新されました"
      redirect_to interview_posts_url
    else
      render 'edit'
    end
  end
  
  def destroy
    @interviewpost = InterviewPost.find(params[:id])
    @interviewpost.destroy
    flash[:success] = "面談内容が削除されました"
    redirect_to interview_posts_path
  end
  

    private

    def interviewpost_params
      params.require(:interview_post).permit(:title, :language,:experience,
                                             :type, :day, :question, :result)
    end
end