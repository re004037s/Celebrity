class StaticPagesController < ApplicationController
  before_action :logged_in_user
  
  def home
    @movies = Movie.all
    @feedback = current_user.feedbacks.build
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
    @ajax_res = params[:impression]
    if params[:begi]
    
    elsif params[:midd]
    
    end
    
  end

end
