class FeedbacksController < ApplicationController
  
  # updateを兼ねる
  def create
    movie_id = params[:feedback][:movie_id]
    @feedback_1 = current_user.feedbacks.build(feedback_params)
    @feedback_2 = current_user.feedbacks.find_by(movie_id: movie_id)

    if @feedback_2.nil?
      # 新規作成
      @feedback_1.save
      @movie_id   = @feedback_1.movie_id
      @sort_order = Movie.find_by(id: movie_id).sort_order
    else
      # 更新
      @feedback_2.update_attributes(feedback_params)
      @movie_id = nil
    end

    @movies = Movie.all
    @category = MovieCategory.find_by(id: Movie.find_by(id: movie_id).movie_category_id)

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
