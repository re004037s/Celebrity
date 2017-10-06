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
  
  def qa
  end
  
  def progate
    @html_css_status = HtmlCssStatus.find_or_create_by(user_id: current_user.id)
    @javascript_status = JavascriptStatus.find_or_create_by(user_id: current_user.id)
    @ruby_status = RubyStatus.find_or_create_by(user_id: current_user.id)
    @rubyonrails_status = RubyonrailsStatus.find_or_create_by(user_id: current_user.id)
  end
  
  def railstutorial
    @railstutorial_status = RailstutorialStatus.find_or_create_by(user_id: current_user.id)
  end
  
  def engineer
  end

  def job
  end
  
  def study
  end

  private
    
    def setting
      @movies = Movie.all
      @feedback = current_user.feedbacks.build
      @hide = 'hide-movie'
      
      @home_flag = !!current_user.feedbacks.find_by(movie_id: 2)
      @freelance_flag = !!current_user.feedbacks.find_by(movie_id: 4)
      @able_engineer_flag = !!current_user.feedbacks.find_by(movie_id: 7)
      @job_hunting_flag = !!current_user.feedbacks.find_by(movie_id: 10)
      @program_learn_flag = !!current_user.feedbacks.find_by(movie_id: 17)
      
      if current_user.html_css_status.ji_2 \
        && current_user.javascript_status.do_beginner \
        && current_user.ruby_status.ga_5 \
        && current_user.rubyonrails_status.do_4
          @progate_comp_flag = true
      else
          @progate_comp_flag = false
      end
    end
end
