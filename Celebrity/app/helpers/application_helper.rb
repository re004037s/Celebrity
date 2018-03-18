module ApplicationHelper
    
  def movie_comp?
    last_movie = MovieCategory.where(must_view: true).order('sort_order').last.movies.order('sort_order').last
    if (current_user.feedbacks.find_by(movie_id: last_movie.id))
    # 完了予定日の粒度変更により一旦非表示
    # current_user.html_css_status.schedule_date &&
    # current_user.javascript_status.schedule_date &&
    # current_user.ruby_status.schedule_date &&
    # current_user.rubyonrails_status.schedule_date)
      return true
    else
      return false
    end  
  end
  
  # アクションを判定して条件分岐（viewのソースを変更）
  # 必要なりましたが、一応残しておきます。
  # def change_background_image?
  #   path = controller_path + '#' + action_name
  #   path.in?(['sessions#new', 'users#new', 'password_resets#edit', 'password_resets#new'])
  # end
  def railstutorial_comp?
    if current_user.railstutorial_status.chapter1 && current_user.railstutorial_status.chapter2 && 
        current_user.railstutorial_status.chapter3 && current_user.railstutorial_status.chapter4 && 
        current_user.railstutorial_status.chapter5 && current_user.railstutorial_status.chapter6 && 
        current_user.railstutorial_status.chapter7 && current_user.railstutorial_status.chapter8 &&
        current_user.railstutorial_status.chapter9 && current_user.railstutorial_status.chapter10 &&
        current_user.railstutorial_status.chapter11 && current_user.railstutorial_status.chapter12 && 
        current_user.railstutorial_status.chapter13 && current_user.railstutorial_status.chapter14
          return true
            else
          return false
    end
  end

  def progatetask_tutolialday_comp?
         current_user_html = current_user.html_css_status
         current_user_javascript = current_user.javascript_status
         current_user_ruby = current_user.ruby_status
         current_user_rubyonrails = current_user.rubyonrails_status
         current_user_railstutorial = current_user.railstutorial_status
         

         if ((current_user_html.ga_beginner && current_user_html.ga_middle && 
         current_user_html.ga_advanced && current_user_html.do_beginner && 
         current_user_html.do_middle && current_user_html.do_advanced && 
         current_user_html.ji_1 && current_user_html.ji_2 &&
         current_user_javascript.ga_1 && current_user_javascript.ga_2 &&
         current_user_javascript.ga_3 && current_user_javascript.ga_4 &&
         current_user_javascript.do_1 &&
         current_user_ruby.ga_1 && current_user_ruby.ga_2 && 
         current_user_ruby.ga_3 && current_user_ruby.ga_4 && 
         current_user_ruby.ga_5 &&current_user_rubyonrails.ga_1 &&
         current_user_rubyonrails.ga_2 && current_user_rubyonrails.ga_3 &&
         current_user_rubyonrails.ga_4 && current_user_rubyonrails.ga_5 &&
         current_user_rubyonrails.ga_6 && current_user_rubyonrails.ga_7 &&
         current_user_rubyonrails.ga_8 && current_user_rubyonrails.ga_9 &&
         current_user_rubyonrails.ga_10 && current_user_rubyonrails.ga_11 &&
         current_user_rubyonrails.do_1 && current_user_rubyonrails.do_2 &&
         current_user_rubyonrails.do_3 && current_user_rubyonrails.do_4) &&
         (current_user_railstutorial.schedule_date || current_user.railstutorial_status.chapter1 || current_user.railstutorial_status.chapter2 || 
         current_user.railstutorial_status.chapter3 || current_user.railstutorial_status.chapter4 || 
         current_user.railstutorial_status.chapter5 || current_user.railstutorial_status.chapter6 || 
         current_user.railstutorial_status.chapter7 || current_user.railstutorial_status.chapter8 ||
         current_user.railstutorial_status.chapter9 || current_user.railstutorial_status.chapter10 ||
         current_user.railstutorial_status.chapter11 || current_user.railstutorial_status.chapter12 ||
         current_user.railstutorial_status.chapter13 || current_user.railstutorial_status.chapter14))
          return true
          else
          return false
         end
  end
  
  def date_format(datetime)
    time_ago_in_words(datetime) + '前'
  end

end
