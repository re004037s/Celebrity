class QuestionsController < ApplicationController
    before_action :admin_user, only:[:index, :create, :edit, :delete ]
    
    def index
        @questions = Question.all.page(params[:page])
    end


    def new
        @question = Question.new 
    end

    def create
        @question = Question.create(question_params)
            if @question.save
                flash[:success] = "作成しました"
                redirect_to questions_url
            else
                flash[:danger] = "再度入力して下さい"
                redirect_to :back
            end
    end


    def edit
        @question = Question.find(params[:id])
    end
    
    def update
        @question = Question.find(params[:id])
            if @question.update_attributes(question_params)
                flash[:success] = "更新しました"
                redirect_to questions_url
            else
                flash[:danger] = "再度入力して下さい"
                redirect_to :back
            end
    end
    
    
    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        flash[:success] = "削除されました"
        redirect_to questions_url
    end
   
    
 private
 
    def question_params
        params.require(:question).permit(:question, :answer, :category_id)
    end
    
    
end
