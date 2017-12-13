class TopController < ApplicationController
  before_action :logged_in_user
  before_action :set_movie_categories, only: [:index]
  
  def index
    @new_movies = Movie.all.where(['created_at > ?', Date.today.prev_day(7)])
    @current_user_html = current_user.html_css_status
    if @current_user_html.schedule_date
      if (@current_user_html.ga_beginner && @current_user_html.ga_middle && 
        @current_user_html.ga_advanced && @current_user_html.do_beginner && 
        @current_user_html.do_middle && @current_user_html.do_advanced && 
        @current_user_html.ji_1 && @current_user_html.ji_2) != true
          if @current_user_html.schedule_date == Date.today + 3
            @alert_messages_html = "完了予定日まであと3日です→【Progate:HTML&CSSコース】"
            elsif @current_user_html.schedule_date == Date.today + 2
            @alert_messages_html = "完了予定日まであと2日です→【Progate:HTML&CSSコース】"
            elsif @current_user_html.schedule_date == Date.today + 1
            @alert_messages_html = "完了予定日まであと1日です→【Progate:HTML&CSSコース】"
            elsif @current_user_html.schedule_date == Date.today
            @alert_messages_html = "今日が完了予定日です→【Progate:HTML&CSSコース】"
            elsif @current_user_html.schedule_date < Date.today
            @alert_messages_html = "完了予定日を過ぎています→【Progate:HTML&CSSコース】"
            else
            @alert_messages_html = ""
          end
      end
    end
    
    @current_user_javascript = current_user.javascript_status
    if @current_user_javascript.schedule_date
      if (@current_user_javascript.ga_beginner && @current_user_javascript.do_beginner) != true
          if @current_user_javascript.schedule_date == Date.today + 3
            @alert_messages_javascript = "完了予定日まであと3日です→【Progate:javascriptコース】"
            elsif @current_user_javascript.schedule_date == Date.today + 2
            @alert_messages_javascript = "完了予定日まであと2日です→【Progate:javascriptコース】"
            elsif @current_user_javascript.schedule_date == Date.today + 1
            @alert_messages_javascript = "完了予定日まであと1日です→【Progate:javascriptコース】"
            elsif @current_user_javascript.schedule_date == Date.today
            @alert_messages_javascript = "今日が完了予定日です→【Progate:javascriptコース】"
            elsif @current_user_javascript.schedule_date < Date.today
            @alert_messages_javascript = "完了予定日を過ぎています→【Progate:javascriptコース】"
            else
            @alert_messages_javascript = ""
          end
      end
    end
    
    
    @current_user_ruby = current_user.ruby_status
    if @current_user_ruby.schedule_date
      if (@current_user_ruby_ga_1 && @current_user_ruby_ga_2 && 
        @current_user_ruby_ga_3 && @current_user_ruby_ga_4 && 
        @current_ruby_ga_5) != true
          if @current_user_ruby.schedule_date == Date.today + 3
            @alert_messages_ruby = "完了予定日まであと3日です→【Progate:Rubyコース】"
            elsif @current_user_ruby.schedule_date == Date.today + 2
            @alert_messages_ruby = "完了予定日まであと2日です→【Progate:Rubyコース】"
            elsif @current_user_ruby.schedule_date == Date.today + 1
            @alert_messages_ruby = "完了予定日まであと1日です→【Progate:Rubyコース】"
            elsif @current_user_ruby.schedule_date == Date.today
            @alert_messages_ruby = "今日が完了予定日です→【Progate:Rubyコース】"
            elsif @current_user_ruby.schedule_date < Date.today
            @alert_messages_ruby = "完了予定日を過ぎています→【Progate:Rubyコース】"
            else
            @alert_messages_ruby = ""
          end
      end
    end
    
    @current_user_rubyonrails = current_user.rubyonrails_status
    if @current_user_rubyonrails.schedule_date
      if (@current_user_rubyonrails.ga_1 && @current_user_rubyonrails.ga_2 && 
        @current_user_rubyonrails.ga_3 && @current_user_rubyonrails.ga_4 && 
        @current_user_rubyonrails.ga_5 && @current_user_rubyonrails.ga_6 && 
        @current_user_rubyonrails.ga_7 && @current_user_rubyonrails.ga_8 &&
        @current_user_rubyonrails.ga_9 && @current_user_rubyonrails.ga_10 &&
        @current_user_rubyonrails.ga_11 && @current_user_rubyonrails.do_1 &&
        @current_user_rubyonrails.do_2 && @current_user_rubyonrails.do_3 &&
        @current_user_rubyonrails.do_4) != true
          if @current_user_rubyonrails.schedule_date == Date.today + 3
            @alert_messages_rubyonrails = "完了予定日まであと3日です→【Progate:Ruby on railsコース】"
            elsif @current_user_rubyonrails.schedule_date == Date.today + 2
            @alert_messages_rubyonrails = "完了予定日まであと2日です→【Progate:Ruby on railsコース】"
            elsif @current_user_rubyonrails.schedule_date == Date.today + 1
            @alert_messages_rubyonrails = "完了予定日まであと1日です→【Progate:Ruby on railsコース】"
            elsif @current_user_rubyonrails.schedule_date == Date.today
            @alert_messages_rubyonrails = "今日が完了予定日です→【Progate:Ruby on railsコース】"
            elsif @current_user_rubyonrails.schedule_date < Date.today
            @alert_messages_rubyonrails = "完了予定日を過ぎています→【Progate:Ruby on railsコース】"
            else
            @alert_messages_rubyonrails = ""
          end
      end
    end
    
    @current_user_railstutorial = current_user.railstutorial_status
    if @current_user_railstutorial.schedule_date
      if (@current_user_railstutorial.chapter1 && @current_user_railstutorial.chapter2 && 
        @current_user_railstutorial.chapter3 && @current_user_railstutorial.chapter4 && 
        @current_user_railstutorial.chapter5 && @current_user_railstutorial.chapter6 && 
        @current_user_railstutorial.chapter7 && @current_user_railstutorial.chapter8 &&
        @current_user_railstutorial.chapter9 && @current_user_railstutorial.chapter10 &&
        @current_user_railstutorial.chapter11 && @current_user_railstutorial.chapter12 &&
        @current_user_railstutorial.chapter13 && @current_user_railstutorial.chapter14) != true
          if @current_user_railstutorial.schedule_date == Date.today + 3
            @alert_messages_railstutorial = "完了予定日まであと3日です→【railstutorial】"
            elsif @current_user_railstutorial.schedule_date == Date.today + 2
            @alert_messages_railstutorial = "完了予定日まであと2日です→【railstutorial】"
            elsif @current_user_railstutorial.schedule_date == Date.today + 1
            @alert_messages_railstutorial = "完了予定日まであと1日です→【railstutorial】"
            elsif @current_user_railstutorial.schedule_date == Date.today
            @alert_messages_railstutorial = "今日が完了予定日です→【railstutorial】"
            elsif @current_user_railstutorial.schedule_date < Date.today
            @alert_messages_railstutorial = "完了予定日を過ぎています→【railstutorial】"
            else
            @alert_messages_railstutorial = ""
          end
      end
    end
    
    @current_user_movie = current_user.user_movie_status
     if current_user.user_movie_status.try(:schedule_date).present?
        @flg = 0
        @categories = MovieCategory.all
        @categories.each do |category|
          category.movies.order('sort_order').each do |movie|
          feedback = current_user.feedbacks.find_by(movie_id: movie.id)
            @flg = 1 if !feedback.present?
          end
        end
                
        if @flg == 1
          if @current_user_movie.schedule_date == Date.today + 3
            @alert_messages_movie = "完了予定日まであと3日です→【railstutorial】"
            elsif @current_user_movie.schedule_date == Date.today + 2
            @alert_messages_movie = "完了予定日まであと2日です→【railstutorial】"
            elsif @current_user_movie.schedule_date == Date.today + 1
            @alert_messages_movie = "完了予定日まであと1日です→【railstutorial】"
            elsif @current_user_movie.schedule_date == Date.today
            @alert_messages_movie = "今日が完了予定日です→【railstutorial】"
            elsif @current_user_movie.schedule_date < Date.today
            @alert_messages_movie = "完了予定日を過ぎています→【railstutorial】"
            else
            @alert_messages_movie = ""
          end
      end
    end
  end

  private
  
    def set_movie_categories
      @categories_all = MovieCategory.all.order('sort_order')
    end
end