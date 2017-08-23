class StaticPagesController < ApplicationController
  before_action :logged_in_user

  def home
    if @feedback_progate = current_user.feedbacks.find_by(movie_id:3) 
      @progate_flag = true
      @free_flag = true
      @home_flag = true
      
    elsif @feedback_free = current_user.feedbacks.find_by(movie_id:2)
      @free_flag = true
      @home_flag = true
    
    elsif @feedback_home = current_user.feedbacks.find_by(movie_id:1)
      @home_flag = true
    end
    
  end
  
  def free
    if @feedback_progate = current_user.feedbacks.find_by(movie_id:3) 
      @progate_flag = true
      @free_flag = true
      @home_flag = true
      
    elsif @feedback_free = current_user.feedbacks.find_by(movie_id:2)
      @free_flag = true
      @home_flag = true
    
    elsif @feedback_home = current_user.feedbacks.find_by(movie_id:1)
      @home_flag = true
    end
  end

  def progate
    
    # @feedbacks = Feedback.last
    # @feedbacks.reload
    
    @movies = Movie.all
    
    @user = current_user
    
  end
  
  def progate
    # 最後にinsertした内容を読み込む
    @feedbacks = Feedback.last
    @feedbacks.reload
    
    # link_to のオープンフラグ
    if @feedback_progate = current_user.feedbacks.find_by(movie_id:6) 
      @progate_flag = true
      @free_flag = true
      @home_flag = true
      
    elsif @feedback_free = current_user.feedbacks.find_by(movie_id:2)
      @free_flag = true
      @home_flag = true
    
    elsif @feedback_home = current_user.feedbacks.find_by(movie_id:1)
      @home_flag = true
    end
    
    # 受け取った値
    if params[:impression]

      @msg = params[:impression]
      
    elsif params[:beginner]
      
      @msg = "you push beginner"
      
    elsif params[:intermediate]
      
      @msg = "you push intermediate"

    elsif params[:expert]

      @msg = "you push expert"
    
    end
    
    # 送信する内容
    @feedbacks = current_user.feedbacks.build(feedback: params[:impression], movie_id:6)
    @feedbacks.save

  end
  
  def rails
    # link_to のオープンフラグ
    if @feedback_progate = current_user.feedbacks.find_by(movie_id:3) 
      @progate_flag = true
      @free_flag = true
      @home_flag = true
      
    elsif @feedback_free = current_user.feedbacks.find_by(movie_id:2)
      @free_flag = true
      @home_flag = true
    
    elsif @feedback_home = current_user.feedbacks.find_by(movie_id:1)
      @home_flag = true
    end
  end
  
  def qa
    # link_to のオープンフラグ
    if @feedback_progate = current_user.feedbacks.find_by(movie_id:3) 
      @progate_flag = true
      @free_flag = true
      @home_flag = true
      
    elsif @feedback_free = current_user.feedbacks.find_by(movie_id:2)
      @free_flag = true
      @home_flag = true
    
    elsif @feedback_home = current_user.feedbacks.find_by(movie_id:1)
      @home_flag = true
    end
  end
  
  def about
  end
  
  def help
  end
  
  def contact
  end
  
  private
    def feedback_params
      params.require(:feedback).permit(:impression, movie_id)
    end
end

