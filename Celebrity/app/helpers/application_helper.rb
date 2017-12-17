module ApplicationHelper
  def progate_comp?
    if current_user.javascript_status.do_beginner && current_user.ruby_status.ga_5 && current_user.rubyonrails_status.do_4
      return true
    else
      return false
    end
  end
  
  def movie_comp?
    last_movie = MovieCategory.where(must_view: true).order('sort_order').last.movies.order('sort_order').last
    if (current_user.feedbacks.find_by(movie_id: last_movie.id) &&
    current_user.html_css_status.schedule_date &&
    current_user.javascript_status.schedule_date &&
    current_user.ruby_status.schedule_date &&
    current_user.rubyonrails_status.schedule_date)
      return true
    else
      return false
    end  
  end    
end
