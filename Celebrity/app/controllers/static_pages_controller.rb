class StaticPagesController < ApplicationController
  before_action :logged_in_user
  
  def home
  end

  def about
  end
  
  def help
  end
  
  def contact
  end
  
  def qa
  end
  
  def progate
    
    @movies = Movie.all
    
  
  end
  
  def progate

    if params[:impression]

      @msg = params[:impression]
      
    elsif params[:beginner]
      
      @msg = "you push beginner"
      
    elsif params[:intermediate]
      
      @msg = "you push intermediate"

    elsif params[:expert]

      @msg = "you push expert"
    
    else
    
    end
    
    @user = User.find_by(id:3)
    @feedbacks = @user.feedbacks.build(feedback: params[:impression], movie_id:2)
    @feedbacks.save

  end
  
  private
    def feedback_params
      params.require(:feedback).permit(:impression, movie_id)
    end
  

end
