class FaqsController < ApplicationController
    before_action :admin_user, only:[:index, :create, :edit, :delete ]
    
    def index
    end
    
    def new
        @faq = Question.new 
    end

    def create
    #   @faq = Question.new(question_params)
    #   if @faq.save
    #      flash[:success] = "作成しました"
    #      redirect_to faqs_url
    #   else
    #      flash[:danger] = "再度入力して下さい"
    #      redirect_to :back
    #   end
    end
    
    def edit
    end
    
    def delete
    end
    
 private
  def question_params
      params.require(:question).permit(:question, :answer)
  end
    
end