class TermsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :edit, :destroy]
  before_action :admin_user, only: [:new, :edit]
  
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
    #@terms = Term.all.page(params[:page])
    # @terms = Term.page().partiallysearch(params[:key])
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
      params.require(:term).permit(:name, :content, :key)
    end
end
