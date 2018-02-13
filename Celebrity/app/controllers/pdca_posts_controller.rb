class PdcaPostsController < ApplicationController
    before_action :logged_in_user, only: [:index, :create, :edit, :destroy]
    # before_action :correct_user,   only: [:edit, :update, :destroy]
  
    def index
      @pdcaposts = PdcaPost.all.page(params[:page])
      @pdcapost = PdcaPost.new
    end
    
    def create
      @pdcapost = current_user.pdca_posts.build(pdcapost_params)
      if @pdcapost.save
        flash[:success] = "PDCA報告が投稿されました"
        redirect_to pdca_posts_url
      else
        flash[:danger] = "全てのPDCA項目を入力してから報告してください"
        redirect_to :back
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
  
  def get_image
    @image = User.find(params[:id])
    send_data(@image.picture_file)
  end
    
  private

    def pdcapost_params
      params.require(:pdca_post).permit(:date, :plan, :do, :check, :action, :user_id)
    end
    
end
