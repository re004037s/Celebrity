class StaticPagesController < ApplicationController
  def home
  end

  def about
  end
  
  def help
  end
  
  def logout
  end
  
  def login
  end
  
  def contact
  end
  
  def signup
  end
  
  def qa
  end
  
  def new
    # @time = Time.now.to_s
    # @e = Movie.new()
  end
  
  def update_time
    @time = Time.now.to_s
    @greeting = params[:greeting]
    render
  end
end