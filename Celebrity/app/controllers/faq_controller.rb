class FaqController < ApplicationController
  include ApplicationHelper
  
  def index
    @faqs = Question.all.order('created_at ASC')
    @faq = Question.new
  end

  def create
   @faq = Question.new(faq_params)
    if @faq.save
      flash[:success] = "質問が登録されました"
      redirect_to faq_index_path
    else
      render 'index'
    end
  end
  
  def update
    @faq = Question.find(params[:id])
    if @faq.update_attributes(faq_params)
      flash[:success] = "内容が更新されました"
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
