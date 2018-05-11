class QuestionCategoriesController < ApplicationController
    before_action :admin_user, only:[:index, :create, :edit, :delete ]
    
    def index
    end
    
    def new
        @question_categories = QuestionCategory.new
    end
    
    def create
        @question_categories = QuestionCategory.new(question_category_params)
        if @question_categories.save
            flash[:success] = "作成しました"
            redirect_to questions_url
        else
            flash[:danger] = "再度入力して下さい"
            redirect_to :back
        end
    end
    
    def edit
        @question_categories = QuestionCategory.find(params[:id])
    end
    
    def update
        @question_categories = QuestionCategory.find(params[:id])
        if @question_categories.update_attributes(question_category_params)
            flash[:success] = "更新しました"
            redirect_to questions_url
        else
            flash[:danger] = "再度入力して下さい"
            redirect_to :back
        end
    end
    
    def destroy
                        @question_categories = QuestionCategory.find(params[:id])
                @question_categories.destroy
        flash[:success] = "削除されました"
        redirect_to questions_url
    end
    
    private
    
    def question_category_params
        params.require(:question_category).permit(:name)
    end
    
end