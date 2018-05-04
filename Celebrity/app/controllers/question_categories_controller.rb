class QuestionCategoriesController < ApplicationController
    before_action :admin_user, only:[:index, :create, :edit, :delete ]
    
    def index
    end
    
    def new
        @question_category = QuestionCategory.new
    end
    
    def create
        @question_category = QuestionCategory.new(question_category_params)
            if @question_category.save
                flash[:success] = "作成しました"
                redirect_to questions_url
            else
                flash[:danger] = "再度入力して下さい"
                redirect_to :back
            end
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def question_category_params
        params.require(:question_category).permit(:name)
    end
    
end