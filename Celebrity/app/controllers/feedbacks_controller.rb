class FeedbacksController < ApplicationController
  
  # updateを兼ねる
  def create
    @feedback_1 = current_user.feedbacks.build(feedback_params)
    @feedback_2 = current_user.feedbacks.find_by(movie_id: params[:feedback][:movie_id])
    
    if @feedback_2.nil?
      # 新規作成
      @feedback_1.save
      @movie_id = @feedback_1.movie_id
    else
      # 更新
      @feedback_2.update_attributes(feedback_params)
      @movie_id = nil
    end
    @movies = Movie.all

  end
  
  def update
  end

  def destroy
  end
  
  private
  
    def feedback_params
      params.require(:feedback).permit(:feedback, :movie_id)
    end

end
