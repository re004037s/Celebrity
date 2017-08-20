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
    # user_id(current_user_id) とmovie_idを取得する

    @user = User.find_by(id:1)
    @feedbacks = @user.feedbacks.build(feedback: params[:impression], movie_id: 1)

    # DBのsave　が返る前に処理が進む
    
    if !@feedbacks.save

      @msg = params[:impression]

    end
    
    if params[:beginner]
      
      @msg = "you push beginner"
   
    elsif params[:intermediate]
    
      @msg = "you push intermediate"

    end
    
  end
  
  private
    def feedback_params
      params.require(:feedback).permit(:impression, movie_id)
    end
  

end
