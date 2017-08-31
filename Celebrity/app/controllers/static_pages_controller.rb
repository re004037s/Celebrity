class StaticPagesController < ApplicationController
  before_action :logged_in_user
  before_action :setting
  
  def home
  end
  
  def freelance
  end

  def program_learn
  end
  
  def able_engineer
  end
  
  def job_hunting
  end
 
#  def qa
#  end
  
  def progate
    @ajax_res = params[:impression]
    if params[:begi]
    elsif params[:midd]
    end
  end

  private
    
    def setting
      @movies = Movie.all
      @feedback = current_user.feedbacks.build
      
      @home_flag = !!current_user.feedbacks.find_by(movie_id: 2)
      @freelance_flag = !!current_user.feedbacks.find_by(movie_id: 4)
      @able_engineer_flag = !!current_user.feedbacks.find_by(movie_id: 7)
      @job_hunting_flag = !!current_user.feedbacks.find_by(movie_id: 10)
      @program_learn_flag = !!current_user.feedbacks.find_by(movie_id: 16)
    end

end
