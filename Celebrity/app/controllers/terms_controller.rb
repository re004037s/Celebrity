class TermsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :edit, :destroy]
  #before_action :admin_user, only:[:destroy]
  #before_action :correct_user,   only: [:destroy]

  def new
    @term = Term.new
  end
  
  def create
    @term =  Term.new(term_params)
    if @term.save
      flash[:success] = "新しい用語が登録されました"
      redirect_to terms_url
    else
      render 'new'
    end
  end
  
  def index
    @terms = Term.search(params[:search]).order('id')
  end
  
  def ajax_search
    @terms = Term.page().partiallysearch(params[:key])
    render json:@terms
  end
  
  def edit
    @term = Term.find(params[:id])
  end
  
  def update
    @term = Term.find(params[:id])
    if @term.update_attributes(term_params)
      flash[:success] = "用語が更新されました"
      redirect_to terms_url
    else
      render 'edit'
    end
  end

  def destroy
    @term = Term.find(params[:id])
    @term.destroy
    flash[:success] = "用語が削除されました"
    redirect_to terms_url
  end
  
  private

    def term_params
      params.require(:term).permit(:name, :content, :key, :create_user_id, :user_id)
    end
    
    # def correct_user
    #   @user = User.find_by(params[:create_user_id])
    #   redirect_to(root_url) if @user.id == current_user.id
    # end
end
