class StaticPagesController < ApplicationController
  before_action :logged_in_user
  before_action :setting
  before_action :set_movie_categories
  
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

  private
    
    def setting
      @movies = Movie.all
      @feedback = current_user.feedbacks.build

      if current_user.html_css_status.ji_2 \
        && current_user.javascript_status.do_beginner \
        && current_user.ruby_status.ga_5 \
        && current_user.rubyonrails_status.do_4
          @progate_comp_flag = true
      else
          @progate_comp_flag = false
      end
    end
    
    def set_movie_categories
      @categories_all = MovieCategory.all.order('sort_order')
    end
    
    def portfolio
      if logged_in?
      @comment  = current_user.commnets.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      end
    end
end
