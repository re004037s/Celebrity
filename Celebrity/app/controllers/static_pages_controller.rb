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
    @ajax_res = params[:impression]
    if params[:begi]
    
    elsif params[:midd]
    
    end
    
  end
  def engineer
  end

  def job
  end
  
  def study
  end

end
