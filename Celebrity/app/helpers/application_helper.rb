module ApplicationHelper
    
  # def movie_comp?
  #   last_movie = MovieCategory.where(must_view: true).where(free_engineer_movie: true).order('sort_order').last.movies.order('sort_order').last
  #   if (current_user.feedbacks.find_by(movie_id: last_movie.id))
  #   # 完了予定日の粒度変更により一旦非表示
  #   # current_user.html_css_status.schedule_date &&
  #   # current_user.javascript_status.schedule_date &&
  #   # current_user.ruby_status.schedule_date &&
  #   # current_user.rubyonrails_status.schedule_date)
  #     return true
  #   else
  #     return false
  #   end  
  # end
  #以下に変更しました。
  
  def movie_comp?
    if current_user.free_engineer_user && current_user.venture_user && current_user.staff_user
      if Feedback.where(user_id: current_user).count >= Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'free').ids).count
        return true
      else
        return false
      end
    elsif current_user.free_engineer_user && current_user.venture_user
      if Feedback.where(user_id: current_user).count >= Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'free').ids).count
        return true
      else
        return false
      end
    elsif current_user.free_engineer_user && current_user.staff_user
      if Feedback.where(user_id: current_user).count >= Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'free').ids).count
        return true
      else
        return false
      end
    elsif current_user.venture_user && current_user.staff_user
      if Feedback.where(user_id: current_user).count >= Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'staff').ids).count
        return true
      else
        return false
      end
    elsif current_user.free_engineer_user
      if Feedback.where(user_id: current_user).count >= Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'free').ids).count
        return true
      else
        return false
      end
    elsif current_user.venture_user
      if Feedback.where(user_id: current_user).count >= Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'venture').ids).count
        return true
      else
        return false
      end
    elsif current_user.staff_user
      if Feedback.where(user_id: current_user).count >= Movie.where(movie_category_id: MovieCategory.where(must_view: true).where(subject: 'staff').ids).count
        return true
      else
        return false
      end
    end
  end
  
  # アクションを判定して条件分岐（viewのソースを変更）
  # 必要なりましたが、一応残しておきます。
  # def change_background_image?
  #   path = controller_path + '#' + action_name
  #   path.in?(['sessions#new', 'users#new', 'password_resets#edit', 'password_resets#new'])
  # end
  
  # 新教材【誰でもわかる勤怠システムチュートリアル】が対象
  def railstutorial_comp?
    if current_user.railstutorial_status.chapter1 && current_user.railstutorial_status.chapter2 && 
      current_user.railstutorial_status.chapter3 && current_user.railstutorial_status.chapter4 && 
      current_user.railstutorial_status.chapter5 && current_user.railstutorial_status.chapter6 && 
      current_user.railstutorial_status.chapter7 && current_user.railstutorial_status.chapter8 &&
      current_user.railstutorial_status.chapter9 && current_user.railstutorial_status.chapter10 
      return true
    else
      return false
    end
  end

  # 新教材のプロゲート代替えと勤怠チュートリアルが完了しているか真偽値で返す
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
      current_user_rubyonrails.ga_10 && current_user_rubyonrails.ga_11) &&
      # current_user_rubyonrails.do_1 && current_user_rubyonrails.do_2 &&
      # current_user_rubyonrails.do_3 && current_user_rubyonrails.do_4) &&
      (current_user_railstutorial.schedule_date || current_user.railstutorial_status.chapter1 || current_user.railstutorial_status.chapter2 || 
      current_user.railstutorial_status.chapter3 || current_user.railstutorial_status.chapter4 || 
      current_user.railstutorial_status.chapter5 || current_user.railstutorial_status.chapter6 || 
      current_user.railstutorial_status.chapter7 || current_user.railstutorial_status.chapter8 ||
      current_user.railstutorial_status.chapter9 || current_user.railstutorial_status.chapter10))
      return true
    else
      return false
    end
  end
  
  def date_format(datetime)
    time_ago_in_words(datetime) + '前'
  end
  
  # Progateの完了予定日が全て入力済みか判定する。
  # 綿貫修正：新教材に合わせる。メソッド名は面倒なのでひとまずこのままで
  def progate_completion?
    html = current_user.html_css_status
    js = current_user.javascript_status
    ruby = current_user.ruby_status
    rails = current_user.rubyonrails_status
    if html.ga_beginner_completion.nil? &&
      html.ga_middle_completion.nil? &&
      # html.ga_advanced_completion.nil? &&
      # html.do_beginner_completion.nil? &&
      # html.do_middle_completion.nil? &&
      # html.do_advanced_completion.nil? &&
      # html.ji_1_completion.nil? &&
      # html.ji_2_completion.nil? &&
      js.ga_1_completion.nil? &&
      # js.ga_2_completion.nil? &&
      # js.ga_3_completion.nil? &&
      # js.ga_4_completion.nil? &&
      # js.do_1_completion.nil? &&
      ruby.ga_1_completion.nil? &&
      ruby.ga_2_completion.nil? &&
      # ruby.ga_3_completion.nil? &&
      # ruby.ga_4_completion.nil? &&
      # ruby.ga_5_completion.nil? &&
      rails.ga_1_completion.nil? &&
      rails.ga_2_completion.nil? &&
      rails.ga_3_completion.nil? &&
      rails.ga_4_completion.nil? &&
      rails.ga_5_completion.nil? &&
      rails.ga_6_completion.nil? &&
      rails.ga_7_completion.nil? &&
      rails.ga_8_completion.nil? &&
      rails.ga_9_completion.nil? &&
      rails.ga_10_completion.nil? &&
      rails.ga_11_completion.nil?
      # rails.do_1_completion.nil? &&
      # rails.do_2_completion.nil? && 
      # rails.do_3_completion.nil? && 
      # rails.do_4_completion.nil?
      return true
    else
      return false
    end
  end
  
  #Progateが全て完了済みか判定する。
  def progate_compd?
    current_user_html = current_user.html_css_status
    current_user_javascript = current_user.javascript_status
    current_user_ruby = current_user.ruby_status
    current_user_rubyonrails = current_user.rubyonrails_status
    
    if current_user_html.ga_beginner &&
      current_user_html.ga_middle && 
    # current_user_html.ga_advanced &&
    # current_user_html.do_beginner && 
    # current_user_html.do_middle &&
    # current_user_html.do_advanced &&
    # current_user_html.ji_1 &&
    # current_user_html.ji_2 &&
    current_user_javascript.ga_1 &&
    # current_user_javascript.ga_2 &&
    # current_user_javascript.ga_3 &&
    # current_user_javascript.ga_4 &&
    # current_user_javascript.do_1 &&
    current_user_ruby.ga_1 &&
    current_user_ruby.ga_2 &&
    # current_user_ruby.ga_3 &&
    # current_user_ruby.ga_4 &&
    # current_user_ruby.ga_5 &&
    current_user_rubyonrails.ga_1 &&
    current_user_rubyonrails.ga_2 &&
    current_user_rubyonrails.ga_3 &&
    current_user_rubyonrails.ga_4 &&
    current_user_rubyonrails.ga_5 &&
    current_user_rubyonrails.ga_6 &&
    current_user_rubyonrails.ga_7 &&
    current_user_rubyonrails.ga_8 &&
    current_user_rubyonrails.ga_9 &&
    current_user_rubyonrails.ga_10 &&
    current_user_rubyonrails.ga_11
    # current_user_rubyonrails.do_1 &&
    # current_user_rubyonrails.do_2 &&
    # current_user_rubyonrails.do_3 &&
    # current_user_rubyonrails.do_4
      return true
    else
      return false
    end
  end
  
  # Railsチュートリアルの完了予定日が入力済みか判定する。
  def railstutorial_completion?
    current_user_railstutorial = current_user.railstutorial_status
    current_user_railstutorial.schedule_date.nil? ? true : false
  end
  
  # ポートフォリオのURLが登録済みか判定する。
  def portfolio_completion?
    if current_user.portfolio_path.nil?
      return true
    else
      return false
    end
  end
end
