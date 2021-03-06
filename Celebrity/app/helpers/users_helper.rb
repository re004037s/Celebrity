module UsersHelper
  def count_html_css(user)
    if user.html_css_status.nil?
      return 0
    else
      sum = 0
      sum += 1 if user.html_css_status.ga_beginner
      sum += 1 if user.html_css_status.ga_middle
      sum += 1 if user.html_css_status.ga_advanced
      sum += 1 if user.html_css_status.do_beginner
      sum += 1 if user.html_css_status.do_middle
      sum += 1 if user.html_css_status.do_advanced
      sum += 1 if user.html_css_status.ji_1
      sum += 1 if user.html_css_status.ji_2
      return sum
    end
  end
  
  def count_javascript(user)
    if user.javascript_status.nil? then
      return 0
    else
      sum = 0
      sum += 1 if user.javascript_status.ga_1
      sum += 1 if user.javascript_status.ga_2
      sum += 1 if user.javascript_status.ga_3
      sum += 1 if user.javascript_status.ga_4
      sum += 1 if user.javascript_status.do_1      
      return sum
    end
  end
  
  def count_ruby(user)
    if user.ruby_status.nil?
      return 0
    else
      sum = 0
      sum += 1 if user.ruby_status.ga_1
      sum += 1 if user.ruby_status.ga_2
      sum += 1 if user.ruby_status.ga_3
      sum += 1 if user.ruby_status.ga_4
      sum += 1 if user.ruby_status.ga_5
      return sum
    end
  end
  
  def count_ruby_on_rails(user)
    if user.rubyonrails_status.nil?
      return 0
    else
      sum = 0
      sum += 1 if user.rubyonrails_status.ga_1
      sum += 1 if user.rubyonrails_status.ga_2
      sum += 1 if user.rubyonrails_status.ga_3
      sum += 1 if user.rubyonrails_status.ga_4
      sum += 1 if user.rubyonrails_status.ga_5
      sum += 1 if user.rubyonrails_status.ga_6
      sum += 1 if user.rubyonrails_status.ga_7
      sum += 1 if user.rubyonrails_status.ga_8
      sum += 1 if user.rubyonrails_status.ga_9
      sum += 1 if user.rubyonrails_status.ga_10
      sum += 1 if user.rubyonrails_status.ga_11
      sum += 1 if user.rubyonrails_status.do_1
      sum += 1 if user.rubyonrails_status.do_2
      sum += 1 if user.rubyonrails_status.do_3
      sum += 1 if user.rubyonrails_status.do_4
      return sum
    end
  end
  
    def count_bootstrap(user)
    if user.bootstrap_status.nil?
      return 0
    else
      sum = 0
      sum += 1 if user.bootstrap_status.ga_1
      sum += 1 if user.bootstrap_status.ga_2
      return sum
    end
  end
  
  def percent_progate(user)
    sum = 0
    sum += count_html_css(user)
    sum += count_javascript(user)
    sum += count_ruby(user)
    sum += count_ruby_on_rails(user)
    sum += count_bootstrap(user)
    return sum * 100 / 33
  end
  
  def count_rails_tutorial(user)
    if user.railstutorial_status.nil?
      return 0
    else
      sum = 0
      sum += 1 if user.railstutorial_status.chapter1
      sum += 1 if user.railstutorial_status.chapter2
      sum += 1 if user.railstutorial_status.chapter3
      sum += 1 if user.railstutorial_status.chapter4
      sum += 1 if user.railstutorial_status.chapter5
      sum += 1 if user.railstutorial_status.chapter6
      sum += 1 if user.railstutorial_status.chapter7
      sum += 1 if user.railstutorial_status.chapter8
      sum += 1 if user.railstutorial_status.chapter9
      sum += 1 if user.railstutorial_status.chapter10
      # sum += 1 if user.railstutorial_status.chapter11
      # sum += 1 if user.railstutorial_status.chapter12
      # sum += 1 if user.railstutorial_status.chapter13
      # sum += 1 if user.railstutorial_status.chapter14
      return sum
    end
  end
  
  def percent_movie(user)
    if user.free_engineer_user && user.venture_user
      enable_movies    = Movie.where(movie_category_id: MovieCategory.where(must_view: true).try(:pluck,:id))
      movie_count      = enable_movies.try(:count)
      enable_movie_ids = enable_movies.try(:pluck,:id)
      sent_count       = user.feedbacks.where(movie_id: enable_movie_ids).try(:count)
  
      return 0 if movie_count == 0 || movie_count.nil?
      return sent_count * 100 / movie_count
    elsif user.free_engineer_user
      enable_movies    = Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'free').try(:pluck,:id))
      movie_count      = enable_movies.try(:count)
      enable_movie_ids = enable_movies.try(:pluck,:id)
      sent_count       = user.feedbacks.where(movie_id: enable_movie_ids).try(:count)
  
      return 0 if movie_count == 0 || movie_count.nil?
      return sent_count * 100 / movie_count
    elsif user.venture_user
      enable_movies    = Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'venture').try(:pluck,:id))
      movie_count      = enable_movies.try(:count)
      enable_movie_ids = enable_movies.try(:pluck,:id)
      sent_count       = user.feedbacks.where(movie_id: enable_movie_ids).try(:count)
  
      return 0 if movie_count == 0 || movie_count.nil?
      return sent_count * 100 / movie_count
    end
  end
  
  #MYPAGEの進捗線用に追加（percent_movieメソッドから呼び出し元によってmovie_countとsent_countだけreturnできるなら不要）
  def count_movie(user)
    if user.free_engineer_user && user.venture_user
      enable_movies    = Movie.where(movie_category_id: MovieCategory.where(must_view: true).try(:pluck,:id))
      movie_count      = enable_movies.try(:count)
      enable_movie_ids = enable_movies.try(:pluck,:id)
      sent_count       = user.feedbacks.where(movie_id: enable_movie_ids).try(:count)
      return movie_count, sent_count
    elsif user.free_engineer_user
      enable_movies    = Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'free').try(:pluck,:id))
      movie_count      = enable_movies.try(:count)
      enable_movie_ids = enable_movies.try(:pluck,:id)
      sent_count       = user.feedbacks.where(movie_id: enable_movie_ids).try(:count)
      return movie_count, sent_count
    elsif user.venture_user
      enable_movies    = Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'venture').try(:pluck,:id))
      movie_count      = enable_movies.try(:count)
      enable_movie_ids = enable_movies.try(:pluck,:id)
      sent_count       = user.feedbacks.where(movie_id: enable_movie_ids).try(:count)
      return movie_count, sent_count
    end
  end
  
  def get_profile_image(user)
    if user.picture_file
      routes = Rails.application.routes.url_helpers
      path = routes.url_for(:controller => 'application', :action => 'show_image', :id => user.id,:model => "User", :column => "picture_file", :only_path => true)
    else
      path = 'default.png'
    end
    
    return path
  end
end