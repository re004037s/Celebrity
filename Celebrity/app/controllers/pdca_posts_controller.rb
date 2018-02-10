class PdcaPostsController < ApplicationController
    before_action :logged_in_user, only: [:index, :create, :edit, :destroy]
    # before_action :correct_user,   only: [:edit, :update, :destroy]
  
    def index
      @pdcaposts = PdcaPost.all.page(params[:page])
    end
    
    def create
      @pdcapost = current_user.qiita_posts.build(pdcapost_params)
      if @pdcapost.save
        flash[:success] = "PDCA報告が投稿されました"
        redirect_to pdca_posts_url
      else
        render 'new'
      end
    end
    
    def update
    @pdcapost = PdcaPost.find(params[:id])
    if @pdcapost.update_attributes(pdcapost_params)
      flash[:success] = "PDCA報告が更新されました"
      redirect_to pdca_posts_url
    else
      render 'edit'
    end
  end

  def destroy
    @pdcapost = PdcaPost.find(params[:id])
    @pdcapost.destroy
    flash[:success] = "PDCA報告が削除されました"
    redirect_to pdca_posts_url
  end
    
  private

    def pdcapost_params
      params.require(:pdca_post).permit(:plan, :do, :check, :action)
    end
    
end
