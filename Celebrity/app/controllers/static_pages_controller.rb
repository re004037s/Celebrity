class StaticPagesController < ApplicationController
  before_action :logged_in_user
  before_action :setting
  before_action :set_movie_categories
  before_action :comp_portfolio, only: :portfolio_mv
  before_action :comp_progate, only: :progate
  before_action :comp_railstutorial, only: :railstutorial
  
  def qa
  end
  
  def portfolio_mv
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
  
  def glossary
  end

  private
    
    def setting
      @movies = Movie.all
      @feedback = current_user.feedbacks.build
      @comment = current_user.comments.build

      if current_user.html_css_status.ji_2 \
        && current_user.javascript_status.do_1 \
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
    
    def comp_portfolio
      
      if current_user.railstutorial_status.chapter1 &&
         current_user.railstutorial_status.chapter14
      else 
        flash[:danger] = "先に Rails Tutorial を完了させて下さい"
        redirect_to root_url
      end
    end
    
    def comp_progate
      if Feedback.where(user_id: current_user).count == 
         Movie.where(movie_category_id: MovieCategory.where(must_view: true).ids).count
      else
        flash[:danger] = "先に動画を視聴して下さい"
        redirect_to root_url
      end
    end
    
    def comp_railstutorial
      if current_user.html_css_status.ji_2 \
        && current_user.javascript_status.do_1 \
        && current_user.ruby_status.ga_5 \
        && current_user.rubyonrails_status.do_4
      else
        flash[:danger] = "先に Progate を完了させて下さい"
        redirect_to root_url
      end
    end
    
end
