class FaqController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :admin_user, only: [:create, :update, :destroy]
  
  def index
    @faq = Question.new
    @faqs1 = Question.where(id: [1])
    @faqs2_4 = Question.where(id: [2, 3, 4])
    @faqs5_8 = Question.where(id: [5, 6, 7, 8])
    @faqs9 = Question.where(id: [9])
    @faqs = Question.where("id > ?", 9)
  end

  def create
   @faq = Question.new(faq_params)
    if @faq.save
      flash[:success] = "質問が作成されました"
      redirect_to faq_index_path
    else
      render 'index'
    end
  end
  
  def update
    @faq = Question.find(params[:id])
    if @faq.update_attributes(faq_params)
      flash[:success] = "内容が変更されました"
      redirect_to faq_index_path
    else
      render 'index'
    end
  end
  
  def destroy
    @faq = Question.find(params[:id])
    @faq.destroy
    flash[:success] = "質問が削除されました"
    redirect_to faq_index_path
  end
  
  private

    def faq_params
      params.require(:question).permit(:question, :answer)
    end
end
