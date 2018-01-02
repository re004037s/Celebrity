class QiitaPostsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  
  def index
    @qiitaposts = QiitaPost.all
  end
  
  def show
    # @user = User.find(params[:id])
    @qiitaposts = QiitaPost.find(params[:id])
  end
  
  def new
    @qiitaposts = QiitaPost.new
  end
  
  def create
    @qiitaposts = current_user.qiita_posts.build(qiitapost_params)
    if @qiitaposts.save
      flash[:success] = "Qiitaが投稿されました"
      redirect_to @qiitaposts
    else
      render 'new'
    end
  end
  
  def edit
    @qiitaposts = QiitaPost.find(params[:id])
  end
  
  def update
    @qiitaposts = QiitaPost.find(params[:id])
    @qiitaposts.attributes = params[:qiita_post]
    if @qiitaposts.save
      flash[:success] = "Qiitaが更新されました"
      redirect_to @qiitaposts
    else
      render 'edit'
    end
  end

  def destroy
    @qiitaposts = QiitaPost.find(params[:id])
    @qiitaposts.destroy
    redirect_to @qiitaposts
  end


  private

    def qiitapost_params
      params.require(:qiita_post).permit(:title, :url)
    end
end
  