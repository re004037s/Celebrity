class FaqController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :admin_user, only: [:create, :update, :destroy]
  
  def index
    @faq = Question.new
    @faqs = Question.all.order(created_at: :ASC)
    @faq_category = QuestionCategory.new
    @faq_categories = QuestionCategory.all.order(created_at: :ASC)
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
  
  def category_create
   @faq_category = QuestionCategory.new(faq_category_params)
    if @faq_category.save
      flash[:success] = "タイトルが作成されました"
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
  
  def category_update
    @faq_category = QuestionCategory.find(params[:id])
    if @faq_category.update_attributes(faq_category_params)
      flash[:success] = "タイトルが変更されました"
      redirect_to faq_index_path
    else
      render 'index'
    end
  end
  
  def destroy
    @faq = Question.find(params[:id])
    if @faq.destroy
      flash[:success] = "質問が削除されました"
      redirect_to faq_index_path
    end
  end
    
  def category_destroy
    @faq_category = QuestionCategory.find(params[:id])
    if @faq_category.destroy
      flash[:success] = "タイトルが削除されました"
      redirect_to faq_index_path
    end
  end
  
  private

    def faq_params
      params.require(:question).permit(:question, :answer, :question_category_id)
    end
    
    def faq_category_params
      params.require(:question_category).permit(:title)
    end
end
