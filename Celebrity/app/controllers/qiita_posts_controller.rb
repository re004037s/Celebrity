class QiitaPostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def index
    @qiitaposts = QiitaPost.all.page(params[:page])
  end
  
  def new
    @qiitapost = QiitaPost.new
  end
  
  def create
    @qiitapost = current_user.qiita_posts.build(qiitapost_params)
    if @qiitapost.save
      flash[:success] = "Qiitaが投稿されました"
      redirect_to qiita_posts_url
    else
      render 'new'
    end
  end
  
  def edit
    @qiitapost = QiitaPost.find(params[:id])
  end
  
  def update
    @qiitapost = QiitaPost.find(params[:id])
    if @qiitapost.update_attributes(qiitapost_params)
      flash[:success] = "Qiitaが更新されました"
      redirect_to qiita_posts_url
    else
      render 'edit'
    end
  end

  def destroy
    # @qiitapost = QiitaPost.find(params[:id])
    @qiitapost.destroy
    flash[:success] = "Qiitaが削除されました"
    redirect_to qiita_posts_url
  end

  
  private

    def qiitapost_params
      params.require(:qiita_post).permit(:title, :url)
    end
    
    def correct_user
      @qiitapost = current_user.qiita_posts.find_by(id: params[:id])
      redirect_to qiita_posts_url if @qiitapost.nil?
    end
end
  