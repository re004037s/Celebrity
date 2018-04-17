class QuestionsController < ApplicationController
        before_action :admin_user, only:[:index, :create, :edit, :delete ]
    
    def index
        @questions = Question.all
    end

    def new
        @question = Question.new 
    end

    def create
        @question = Question.new(question_params)
            if @question.save
                flash[:success] = "作成しました"
                redirect_to questions_url
            else
                flash[:danger] = "再度入力して下さい"
                redirect_to :back
            end
    end
    
    def edit
    end
    
    def delete
    end
    
 private
  def question_params
      params.require(:question).permit(:question, :answer, :category)
  end
    

end
