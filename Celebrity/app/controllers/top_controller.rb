class TopController < ApplicationController
  before_action :logged_in_user
  before_action :set_movie_categories, only: [:index]
  
  def index
    # 期限切れでないお知らせ一覧を取得
    @information = Information.all.where("display_period >= (?)" , Date.today)
    @new_movies = Movie.all.where(['created_at > ?', Date.today.prev_day(7)])
    current_user_html = current_user.html_css_status
    current_user_rubyonrails = current_user.rubyonrails_status
         current_user_html = current_user.html_css_status
         current_user_javascript = current_user.javascript_status
         current_user_ruby = current_user.ruby_status
         current_user_railstutorial = current_user.railstutorial_status
         if (current_user_html.ga_beginner && current_user_html.ga_middle && 
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
         current_user_rubyonrails.do_3 && current_user_rubyonrails.do_4 &&
         current_user_railstutorial.schedule_date.present?) != true
         @finish_flag = 1
         else
         @finish_flag = 0
         end

    if current_user_html.schedule_date
      if (current_user_html.ga_beginner && current_user_html.ga_middle && 
        current_user_html.ga_advanced && current_user_html.do_beginner && 
        current_user_html.do_middle && current_user_html.do_advanced && 
        current_user_html.ji_1 && current_user_html.ji_2) != true
          if current_user_html.schedule_date == Date.today + 3
            @alert_messages_html = "完了予定日まであと3日です"
            elsif current_user_html.schedule_date == Date.today + 2
            @alert_messages_html = "完了予定日まであと2日です"
            elsif current_user_html.schedule_date == Date.today + 1
            @alert_messages_html = "完了予定日まであと1日です"
            elsif current_user_html.schedule_date == Date.today
            @alert_messages_html = "今日が完了予定日です"
            elsif current_user_html.schedule_date < Date.today
            @alert_messages_html = "完了予定日を過ぎています"
            else
            @alert_messages_html = ""
          end
      end
    end
    
    current_user_javascript = current_user.javascript_status
    if current_user_javascript.schedule_date
      if (current_user_javascript.ga_1 && current_user_javascript.ga_2 &&
          current_user_javascript.ga_3 && current_user_javascript.ga_4 &&
          current_user_javascript.do_1 ) != true
          if current_user_javascript.schedule_date == Date.today + 3
            @alert_messages_javascript = "完了予定日まであと3日です"
            elsif current_user_javascript.schedule_date == Date.today + 2
            @alert_messages_javascript = "完了予定日まであと2日です"
            elsif current_user_javascript.schedule_date == Date.today + 1
            @alert_messages_javascript = "完了予定日まであと1日です"
            elsif current_user_javascript.schedule_date == Date.today
            @alert_messages_javascript = "今日が完了予定日です"
            elsif current_user_javascript.schedule_date < Date.today
            @alert_messages_javascript = "完了予定日を過ぎています"
            else
            @alert_messages_javascript = ""
          end
      end
    end
    
    
    current_user_ruby = current_user.ruby_status
    if current_user_ruby.schedule_date
      if (current_user_ruby.ga_1 && current_user_ruby.ga_2 && 
          current_user_ruby.ga_3 && current_user_ruby.ga_4 && 
          current_user_ruby.ga_5) != true
          if current_user_ruby.schedule_date == Date.today + 3
            @alert_messages_ruby = "完了予定日まであと3日です"
            elsif current_user_ruby.schedule_date == Date.today + 2
            @alert_messages_ruby = "完了予定日まであと2日です"
            elsif current_user_ruby.schedule_date == Date.today + 1
            @alert_messages_ruby = "完了予定日まであと1日です"
            elsif current_user_ruby.schedule_date == Date.today
            @alert_messages_ruby = "今日が完了予定日です"
            elsif current_user_ruby.schedule_date < Date.today
            @alert_messages_ruby = "完了予定日を過ぎています"
            else
            @alert_messages_ruby = ""
          end
      end
    end
    
    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.schedule_date
      if (current_user_rubyonrails.ga_1 && current_user_rubyonrails.ga_2 && 
        current_user_rubyonrails.ga_3 && current_user_rubyonrails.ga_4 && 
        current_user_rubyonrails.ga_5 && current_user_rubyonrails.ga_6 && 
        current_user_rubyonrails.ga_7 && current_user_rubyonrails.ga_8 &&
        current_user_rubyonrails.ga_9 && current_user_rubyonrails.ga_10 &&
        current_user_rubyonrails.ga_11 && current_user_rubyonrails.do_1 &&
        current_user_rubyonrails.do_2 && current_user_rubyonrails.do_3 &&
        current_user_rubyonrails.do_4) != true
          if current_user_rubyonrails.schedule_date == Date.today + 3
            @alert_messages_rubyonrails = "完了予定日まであと3日です"
            elsif current_user_rubyonrails.schedule_date == Date.today + 2
            @alert_messages_rubyonrails = "完了予定日まであと2日です"
            elsif current_user_rubyonrails.schedule_date == Date.today + 1
            @alert_messages_rubyonrails = "完了予定日まであと1日です"
            elsif current_user_rubyonrails.schedule_date == Date.today
            @alert_messages_rubyonrails = "今日が完了予定日です"
            elsif current_user_rubyonrails.schedule_date < Date.today
            @alert_messages_rubyonrails = "完了予定日を過ぎています"
            else
            @alert_messages_rubyonrails = ""
          end
      end
    end
    
    current_user_railstutorial = current_user.railstutorial_status
    if current_user_railstutorial.schedule_date
      if (current_user_railstutorial.chapter1 && current_user_railstutorial.chapter2 && 
        current_user_railstutorial.chapter3 && current_user_railstutorial.chapter4 && 
        current_user_railstutorial.chapter5 && current_user_railstutorial.chapter6 && 
        current_user_railstutorial.chapter7 && current_user_railstutorial.chapter8 &&
        current_user_railstutorial.chapter9 && current_user_railstutorial.chapter10 &&
        current_user_railstutorial.chapter11 && current_user_railstutorial.chapter12 &&
        current_user_railstutorial.chapter13 && current_user_railstutorial.chapter14) != true
          if current_user_railstutorial.schedule_date == Date.today + 3
            @alert_messages_railstutorial = "完了予定日まであと3日です"
            elsif current_user_railstutorial.schedule_date == Date.today + 2
            @alert_messages_railstutorial = "完了予定日まであと2日です"
            elsif current_user_railstutorial.schedule_date == Date.today + 1
            @alert_messages_railstutorial = "完了予定日まであと1日です"
            elsif current_user_railstutorial.schedule_date == Date.today
            @alert_messages_railstutorial = "今日が完了予定日です"
            elsif current_user_railstutorial.schedule_date < Date.today
            @alert_messages_railstutorial = "完了予定日を過ぎています"
            else
            @alert_messages_railstutorial = ""
          end
      end
    end
    
    movie_ids = current_user.feedbacks.pluck(:movie_id)
    current_user_movie = current_user.user_movie_status
    last_movie_id = MovieCategory.where(must_view: true).order('sort_order').last.movies.order('sort_order').last.id
    if current_user_movie.schedule_date
    if movie_ids.include?(last_movie_id)
    
      @alert_message_mv = ""
      elsif
        current_user_movie.schedule_date == Date.today + 3
        @alert_message_mv = "【完了予定日3日前】"
      elsif
        current_user_movie.schedule_date == Date.today + 2
        @alert_message_mv = "【完了予定日2日前】"
      elsif
        current_user_movie.schedule_date == Date.today + 1
        @alert_message_mv = "【完了予定日1日前】"
      elsif
        current_user_movie.schedule_date == Date.today
        @alert_message_mv = "【本日完了予定日】"
      elsif
        current_user_movie.schedule_date < Date.today
        @alert_message_mv = "【完了予定日を過ぎました】"
      else
      @alert_message_mv = ""
    end
   end
  end
  
  private
  
    def set_movie_categories
      @categories_all = MovieCategory.all.order('sort_order')
    end
end