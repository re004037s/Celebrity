class FeedbacksController < ApplicationController
  
  # updateを兼ねる
  def create
    @feedback_1 = current_user.feedbacks.build(feedback_params)
    @feedback_2 = current_user.feedbacks.find_by(movie_id: params[:feedback][:movie_id])
    
    if @feedback_2.nil?
      @feedback_1.save
      flash[:success] = '感想を送信しました'
    else
      @feedback_2.update_attributes(feedback_params)
      flash[:success] = '感想を更新しました'
    end
    
    @ref  = request.referer
    redirect_to @ref

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
