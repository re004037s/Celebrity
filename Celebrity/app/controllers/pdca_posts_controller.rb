class PdcaPostsController < ApplicationController
    before_action :logged_in_user, only: [:index, :create, :edit, :destroy]
    before_action :check_guest_user
  
    def index
      @pdcaposts = PdcaPost.all.page(params[:page]).per(15)
      @pdcapost = PdcaPost.new
    end
    
    def create
      @pdcapost = current_user.pdca_posts.build(pdcapost_params)
      if @pdcapost.save
        flash[:success] = "PDCA報告が投稿されました"
        redirect_to pdca_posts_url
      else
        flash[:danger] = "全てのPDCA項目を５００文字以内で入力してから報告してください"
        redirect_to :back
      end
    end
    
    def update
    @pdcapost = PdcaPost.find(params[:id])
    if @pdcapost.update_attributes(pdcapost_params)
      flash[:success] = "PDCA報告が更新されました"
      redirect_to pdca_posts_url
    else
      flash[:danger] = "全てのPDCA項目を５００文字以内で入力してから更新してください"
      redirect_to :back
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
      params.require(:pdca_post).permit(:date, :plan, :do, :check, :action, :user_id)
    end
    
end
