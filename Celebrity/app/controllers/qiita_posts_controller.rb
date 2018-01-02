class QiitaPostsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  
  def index
    # @qiitaposts = Qiitaposts.all
  end
  
  def new
    # @qiitaposts = Qiitaposts.new
  end
  
  def create
    @qiitapost = current_user.qiita_posts.build(qiitapost_params)
    if @qiitapost.save
      flash[:success] = "qiitaが投稿されました"
      redirect_to @qiitapost
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @qiitapost = @user.qiita_posts(page: params[:page])
  end
  
  def destroy
  end

  def edit
  end

  private

    def qiitapost_params
      params.require(:qiita_post).permit(:content)
    end
end
  