class TopController < ApplicationController
  include ApplicationHelper
  include MovieCategoriesHelper

  before_action :logged_in_user
  before_action :movie_schedule_date
  before_action :progate_comp_date
  before_action :railstutorial_comp_date
  before_action :portfolio_comp_path

  def index
    # 期限切れでないお知らせ一覧を取得
    @information = Information.all.where("display_period >= (?)" , Date.today)
    @new_movies = Movie.all.where(['created_at > ?', Date.today.prev_day(7)])

    # まだ視聴していない視聴必須動画(subject:free)のmovie_category.idを取得
    @incomp_category_id = MovieCategory.where(subject: 'free', must_view: true).order(:sort_order)
      .select { |movie_category| before_category_comp?(movie_category) }.last.id

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

    # [Progate] HTML&CSSのパート
    current_user_html = current_user.html_css_status
    if current_user_html.ga_beginner_completion
      if current_user_html.ga_beginner != true
        if current_user_html.ga_beginner_completion == Date.today + 3
          @ga_beginner_completion = "完了予定日まであと3日です"
        elsif current_user_html.ga_beginner_completion == Date.today + 2
          @ga_beginner_completion = "完了予定日まであと2日です"
        elsif current_user_html.ga_beginner_completion == Date.today + 1
          @ga_beginner_completion = "完了予定日まであと1日です"
        elsif current_user_html.ga_beginner_completion == Date.today
          @ga_beginner_completion = "今日が完了予定日です"
        elsif current_user_html.ga_beginner_completion < Date.today
          @ga_beginner_completion = "完了予定日を過ぎています"
        else
          @ga_beginner_completion = ""
        end
      end
    end    

    current_user_html = current_user.html_css_status
    if current_user_html.ga_middle_completion
      if current_user_html.ga_middle != true
        if current_user_html.ga_middle_completion == Date.today + 3
          @ga_middle_completion = "完了予定日まであと3日です"
        elsif current_user_html.ga_middle_completion == Date.today + 2
          @ga_middle_completion = "完了予定日まであと2日です"
        elsif current_user_html.ga_middle_completion == Date.today + 1
          @ga_middle_completion = "完了予定日まであと1日です"
        elsif current_user_html.ga_middle_completion == Date.today
          @ga_middle_completion = "今日が完了予定日です"
        elsif current_user_html.ga_middle_completion < Date.today
          @ga_middle_completion = "完了予定日を過ぎています"
        else
          @ga_middle_completion = ""
        end
      end
    end    

    current_user_html = current_user.html_css_status
    if current_user_html.ga_advanced_completion
      if current_user_html.ga_advanced != true
        if current_user_html.ga_advanced_completion == Date.today + 3
          @ga_advanced_completion = "完了予定日まであと3日です"
        elsif current_user_html.ga_advanced_completion == Date.today + 2
          @ga_advanced_completion = "完了予定日まであと2日です"
        elsif current_user_html.ga_advanced_completion == Date.today + 1
          @ga_advanced_completion = "完了予定日まであと1日です"
        elsif current_user_html.ga_advanced_completion == Date.today
          @ga_advanced_completion = "今日が完了予定日です"
        elsif current_user_html.ga_advanced_completion < Date.today
          @ga_advanced_completion = "完了予定日を過ぎています"
        else
          @ga_advanced_completion = ""
        end
      end
    end    

    current_user_html = current_user.html_css_status
    if current_user_html.do_beginner_completion
      if current_user_html.do_beginner != true
        if current_user_html.do_beginner_completion == Date.today + 3
          @do_beginner_completion = "完了予定日まであと3日です"
        elsif current_user_html.do_beginner_completion == Date.today + 2
          @do_beginner_completion = "完了予定日まであと2日です"
        elsif current_user_html.do_beginner_completion == Date.today + 1
          @do_beginner_completion = "完了予定日まであと1日です"
        elsif current_user_html.do_beginner_completion == Date.today
          @do_beginner_completion = "今日が完了予定日です"
        elsif current_user_html.do_beginner_completion < Date.today
          @do_beginner_completion = "完了予定日を過ぎています"
        else
          @do_beginner_completion = ""
        end
      end
    end    

    current_user_html = current_user.html_css_status
    if current_user_html.do_middle_completion
      if current_user_html.do_middle != true
        if current_user_html.do_middle_completion == Date.today + 3
          @do_middle_completion = "完了予定日まであと3日です"
        elsif current_user_html.do_middle_completion == Date.today + 2
          @do_middle_completion = "完了予定日まであと2日です"
        elsif current_user_html.do_middle_completion == Date.today + 1
          @do_middle_completion = "完了予定日まであと1日です"
        elsif current_user_html.do_middle_completion == Date.today
          @do_middle_completion = "今日が完了予定日です"
        elsif current_user_html.do_middle_completion < Date.today
          @do_middle_completion = "完了予定日を過ぎています"
        else
          @do_middle_completion = ""
        end
      end
    end    

    current_user_html = current_user.html_css_status
    if current_user_html.do_advanced_completion
      if current_user_html.do_advanced != true
        if current_user_html.do_advanced_completion == Date.today + 3
          @do_advanced_completion = "完了予定日まであと3日です"
        elsif current_user_html.do_advanced_completion == Date.today + 2
          @do_advanced_completion = "完了予定日まであと2日です"
        elsif current_user_html.do_advanced_completion == Date.today + 1
          @do_advanced_completion = "完了予定日まであと1日です"
        elsif current_user_html.do_advanced_completion == Date.today
          @do_advanced_completion = "今日が完了予定日です"
        elsif current_user_html.do_advanced_completion < Date.today
          @do_advanced_completion = "完了予定日を過ぎています"
        else
          @do_advanced_completion = ""
        end
      end
    end    

    current_user_html = current_user.html_css_status
    if current_user_html.ji_1_completion
      if current_user_html.ji_1 != true
        if current_user_html.ji_1_completion == Date.today + 3
          @ji_1_completion = "完了予定日まであと3日です"
        elsif current_user_html.ji_1_completion == Date.today + 2
          @ji_1_completion = "完了予定日まであと2日です"
        elsif current_user_html.ji_1_completion == Date.today + 1
          @ji_1_completion = "完了予定日まであと1日です"
        elsif current_user_html.ji_1_completion == Date.today
          @ji_1_completion = "今日が完了予定日です"
        elsif current_user_html.ji_1_completion < Date.today
          @ji_1_completion = "完了予定日を過ぎています"
        else
          @ji_1_completion = ""
        end
      end
    end    

    current_user_html = current_user.html_css_status
    if current_user_html.ji_2_completion
      if current_user_html.ji_2 != true
        if current_user_html.ji_2_completion == Date.today + 3
          @ji_2_completion = "完了予定日まであと3日です"
        elsif current_user_html.ji_2_completion == Date.today + 2
          @ji_2_completion = "完了予定日まであと2日です"
        elsif current_user_html.ji_2_completion == Date.today + 1
          @ji_2_completion = "完了予定日まであと1日です"
        elsif current_user_html.ji_2_completion == Date.today
          @ji_2_completion = "今日が完了予定日です"
        elsif current_user_html.ji_2_completion < Date.today
          @ji_2_completion = "完了予定日を過ぎています"
        else
          @ji_2_completion = ""
        end
      end
    end    

    # [Progate] JavaScriptのパート
    current_user_javascript = current_user.javascript_status
    if current_user_javascript.ga_1_completion
      if current_user_javascript.ga_1 != true
        if current_user_javascript.ga_1_completion == Date.today + 3
          @js_ga_1_completion = "完了予定日まであと3日です"
        elsif current_user_javascript.ga_1_completion == Date.today + 2
          @js_ga_1_completion = "完了予定日まであと2日です"
        elsif current_user_javascript.ga_1_completion == Date.today + 1
          @js_ga_1_completion = "完了予定日まであと1日です"
        elsif current_user_javascript.ga_1_completion == Date.today
          @js_ga_1_completion = "今日が完了予定日です"
        elsif current_user_javascript.ga_1_completion < Date.today
          @js_ga_1_completion = "完了予定日を過ぎています"
        else
          @js_ga_1_completion = ""
        end
      end
    end

    current_user_javascript = current_user.javascript_status
    if current_user_javascript.ga_2_completion
      if current_user_javascript.ga_2 != true
        if current_user_javascript.ga_2_completion == Date.today + 3
          @js_ga_2_completion = "完了予定日まであと3日です"
        elsif current_user_javascript.ga_2_completion == Date.today + 2
          @js_ga_2_completion = "完了予定日まであと2日です"
        elsif current_user_javascript.ga_2_completion == Date.today + 1
          @js_ga_2_completion = "完了予定日まであと1日です"
        elsif current_user_javascript.ga_2_completion == Date.today
          @js_ga_2_completion = "今日が完了予定日です"
        elsif current_user_javascript.ga_2_completion < Date.today
          @js_ga_2_completion = "完了予定日を過ぎています"
        else
          @js_ga_2_completion = ""
        end
      end
    end

    current_user_javascript = current_user.javascript_status
    if current_user_javascript.ga_3_completion
      if current_user_javascript.ga_3 != true
        if current_user_javascript.ga_3_completion == Date.today + 3
          @js_ga_3_completion = "完了予定日まであと3日です"
        elsif current_user_javascript.ga_3_completion == Date.today + 2
          @js_ga_3_completion = "完了予定日まであと2日です"
        elsif current_user_javascript.ga_3_completion == Date.today + 1
          @js_ga_3_completion = "完了予定日まであと1日です"
        elsif current_user_javascript.ga_3_completion == Date.today
          @js_ga_3_completion = "今日が完了予定日です"
        elsif current_user_javascript.ga_3_completion < Date.today
          @js_ga_3_completion = "完了予定日を過ぎています"
        else
          @js_ga_3_completion = ""
        end
      end
    end

    current_user_javascript = current_user.javascript_status
    if current_user_javascript.ga_4_completion
      if current_user_javascript.ga_4 != true
        if current_user_javascript.ga_4_completion == Date.today + 3
          @js_ga_4_completion = "完了予定日まであと3日です"
        elsif current_user_javascript.ga_4_completion == Date.today + 2
          @js_ga_4_completion = "完了予定日まであと2日です"
        elsif current_user_javascript.ga_4_completion == Date.today + 1
          @js_ga_4_completion = "完了予定日まであと1日です"
        elsif current_user_javascript.ga_4_completion == Date.today
          @js_ga_4_completion = "今日が完了予定日です"
        elsif current_user_javascript.ga_4_completion < Date.today
          @js_ga_4_completion = "完了予定日を過ぎています"
        else
          @js_ga_4_completion = ""
        end
      end
    end

      current_user_javascript = current_user.javascript_status
      if current_user_javascript.do_1_completion
        if current_user_javascript.do_1 != true
          if current_user_javascript.do_1_completion == Date.today + 3
            @js_do_1_completion = "完了予定日まであと3日です"
          elsif current_user_javascript.do_1_completion == Date.today + 2
            @js_do_1_completion = "完了予定日まであと2日です"
          elsif current_user_javascript.do_1_completion == Date.today + 1
            @js_do_1_completion = "完了予定日まであと1日です"
          elsif current_user_javascript.do_1_completion == Date.today
            @js_do_1_completion = "今日が完了予定日です"
          elsif current_user_javascript.do_1_completion < Date.today
            @js_do_1_completion = "完了予定日を過ぎています"
          else
            @js_do_1_completion = ""
          end
        end
      end

    # [Progate] Rubyのパート
    current_user_ruby = current_user.ruby_status
    if current_user_ruby.ga_1_completion
      if current_user_ruby.ga_1 != true
        if current_user_ruby.ga_1_completion == Date.today + 3
          @ruby_ga_1_completion = "完了予定日まであと3日です"
        elsif current_user_ruby.ga_1_completion == Date.today + 2
          @ruby_ga_1_completion = "完了予定日まであと2日です"
        elsif current_user_ruby.ga_1_completion == Date.today + 1
          @ruby_ga_1_completion = "完了予定日まであと1日です"
        elsif current_user_ruby.ga_1_completion == Date.today
          @ruby_ga_1_completion = "今日が完了予定日です"
        elsif current_user_ruby.ga_1_completion < Date.today
          @ruby_ga_1_completion = "完了予定日を過ぎています"
        else
          @ruby_ga_1_completion = ""
        end
      end
    end

    current_user_ruby = current_user.ruby_status
    if current_user_ruby.ga_2_completion
      if current_user_ruby.ga_2 != true
        if current_user_ruby.ga_2_completion == Date.today + 3
          @ruby_ga_2_completion = "完了予定日まであと3日です"
        elsif current_user_ruby.ga_2_completion == Date.today + 2
          @ruby_ga_2_completion = "完了予定日まであと2日です"
        elsif current_user_ruby.ga_2_completion == Date.today + 1
          @ruby_ga_2_completion = "完了予定日まであと1日です"
        elsif current_user_ruby.ga_2_completion == Date.today
          @ruby_ga_2_completion = "今日が完了予定日です"
        elsif current_user_ruby.ga_2_completion < Date.today
          @ruby_ga_2_completion = "完了予定日を過ぎています"
        else
          @ruby_ga_2_completion = ""
        end
      end
    end

    current_user_ruby = current_user.ruby_status
    if current_user_ruby.ga_3_completion
      if current_user_ruby.ga_3 != true
        if current_user_ruby.ga_3_completion == Date.today + 3
          @ruby_ga_3_completion = "完了予定日まであと3日です"
        elsif current_user_ruby.ga_3_completion == Date.today + 2
          @ruby_ga_3_completion = "完了予定日まであと2日です"
        elsif current_user_ruby.ga_3_completion == Date.today + 1
          @ruby_ga_3_completion = "完了予定日まであと1日です"
        elsif current_user_ruby.ga_3_completion == Date.today
          @ruby_ga_3_completion = "今日が完了予定日です"
        elsif current_user_ruby.ga_3_completion < Date.today
          @ruby_ga_3_completion = "完了予定日を過ぎています"
        else
          @ruby_ga_3_completion = ""
        end
      end
    end

    current_user_ruby = current_user.ruby_status
    if current_user_ruby.ga_4_completion
      if current_user_ruby.ga_4 != true
        if current_user_ruby.ga_4_completion == Date.today + 3
          @ruby_ga_4_completion = "完了予定日まであと3日です"
        elsif current_user_ruby.ga_4_completion == Date.today + 2
          @ruby_ga_4_completion = "完了予定日まであと2日です"
        elsif current_user_ruby.ga_4_completion == Date.today + 1
          @ruby_ga_4_completion = "完了予定日まであと1日です"
        elsif current_user_ruby.ga_4_completion == Date.today
          @ruby_ga_4_completion = "今日が完了予定日です"
        elsif current_user_ruby.ga_4_completion < Date.today
          @ruby_ga_4_completion = "完了予定日を過ぎています"
        else
          @ruby_ga_4_completion = ""
        end
      end
    end

    current_user_ruby = current_user.ruby_status
    if current_user_ruby.ga_5_completion
      if current_user_ruby.ga_5 != true
        if current_user_ruby.ga_5_completion == Date.today + 3
          @ruby_ga_5_completion = "完了予定日まであと3日です"
        elsif current_user_ruby.ga_5_completion == Date.today + 2
          @ruby_ga_5_completion = "完了予定日まであと2日です"
        elsif current_user_ruby.ga_5_completion == Date.today + 1
          @ruby_ga_5_completion = "完了予定日まであと1日です"
        elsif current_user_ruby.ga_5_completion == Date.today
          @ruby_ga_5_completion = "今日が完了予定日です"
        elsif current_user_ruby.ga_5_completion < Date.today
          @ruby_ga_5_completion = "完了予定日を過ぎています"
        else
          @ruby_ga_5_completion = ""
        end
      end
    end

    # [Progate] Ruby on Railsのパート
    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_1_completion
      if current_user_rubyonrails.ga_1 != true
        if current_user_rubyonrails.ga_1_completion == Date.today + 3
          @rails_ga_1_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_1_completion == Date.today + 2
          @rails_ga_1_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_1_completion == Date.today + 1
          @rails_ga_1_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_1_completion == Date.today
          @rails_ga_1_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_1_completion < Date.today
          @rails_ga_1_completion = "完了予定日を過ぎています"
        else
          @rails_ga_1_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_2_completion
      if current_user_rubyonrails.ga_2 != true
        if current_user_rubyonrails.ga_2_completion == Date.today + 3
          @rails_ga_2_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_2_completion == Date.today + 2
          @rails_ga_2_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_2_completion == Date.today + 1
          @rails_ga_2_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_2_completion == Date.today
          @rails_ga_2_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_2_completion < Date.today
          @rails_ga_2_completion = "完了予定日を過ぎています"
        else
          @rails_ga_2_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_3_completion
      if current_user_rubyonrails.ga_3 != true
        if current_user_rubyonrails.ga_3_completion == Date.today + 3
          @rails_ga_3_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_3_completion == Date.today + 2
          @rails_ga_3_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_3_completion == Date.today + 1
          @rails_ga_3_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_3_completion == Date.today
          @rails_ga_3_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_3_completion < Date.today
          @rails_ga_3_completion = "完了予定日を過ぎています"
        else
          @rails_ga_3_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_4_completion
      if current_user_rubyonrails.ga_4 != true
        if current_user_rubyonrails.ga_4_completion == Date.today + 3
          @rails_ga_4_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_4_completion == Date.today + 2
          @rails_ga_4_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_4_completion == Date.today + 1
          @rails_ga_4_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_4_completion == Date.today
          @rails_ga_4_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_4_completion < Date.today
          @rails_ga_4_completion = "完了予定日を過ぎています"
        else
          @rails_ga_4_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_5_completion
      if current_user_rubyonrails.ga_5 != true
        if current_user_rubyonrails.ga_5_completion == Date.today + 3
          @rails_ga_5_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_5_completion == Date.today + 2
          @rails_ga_5_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_5_completion == Date.today + 1
          @rails_ga_5_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_5_completion == Date.today
          @rails_ga_5_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_5_completion < Date.today
          @rails_ga_5_completion = "完了予定日を過ぎています"
        else
          @rails_ga_5_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_6_completion
      if current_user_rubyonrails.ga_6 != true
        if current_user_rubyonrails.ga_6_completion == Date.today + 3
          @rails_ga_6_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_6_completion == Date.today + 2
          @rails_ga_6_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_6_completion == Date.today + 1
          @rails_ga_6_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_6_completion == Date.today
          @rails_ga_6_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_6_completion < Date.today
          @rails_ga_6_completion = "完了予定日を過ぎています"
        else
          @rails_ga_6_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_7_completion
      if current_user_rubyonrails.ga_7 != true
        if current_user_rubyonrails.ga_7_completion == Date.today + 3
          @rails_ga_7_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_7_completion == Date.today + 2
          @rails_ga_7_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_7_completion == Date.today + 1
          @rails_ga_7_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_7_completion == Date.today
          @rails_ga_7_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_7_completion < Date.today
          @rails_ga_7_completion = "完了予定日を過ぎています"
        else
          @rails_ga_7_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_8_completion
      if current_user_rubyonrails.ga_8 != true
        if current_user_rubyonrails.ga_8_completion == Date.today + 3
          @rails_ga_8_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_8_completion == Date.today + 2
          @rails_ga_8_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_8_completion == Date.today + 1
          @rails_ga_8_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_8_completion == Date.today
          @rails_ga_8_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_8_completion < Date.today
          @rails_ga_8_completion = "完了予定日を過ぎています"
        else
          @rails_ga_8_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_9_completion
      if current_user_rubyonrails.ga_9 != true
        if current_user_rubyonrails.ga_9_completion == Date.today + 3
          @rails_ga_9_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_9_completion == Date.today + 2
          @rails_ga_9_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_9_completion == Date.today + 1
          @rails_ga_9_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_9_completion == Date.today
          @rails_ga_9_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_9_completion < Date.today
          @rails_ga_9_completion = "完了予定日を過ぎています"
        else
          @rails_ga_9_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_10_completion
      if current_user_rubyonrails.ga_10 != true
        if current_user_rubyonrails.ga_10_completion == Date.today + 3
          @rails_ga_10_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_10_completion == Date.today + 2
          @rails_ga_10_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_10_completion == Date.today + 1
          @rails_ga_10_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_10_completion == Date.today
          @rails_ga_10_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_10_completion < Date.today
          @rails_ga_10_completion = "完了予定日を過ぎています"
        else
          @rails_ga_10_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.ga_11_completion
      if current_user_rubyonrails.ga_11 != true
        if current_user_rubyonrails.ga_11_completion == Date.today + 3
          @rails_ga_11_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.ga_11_completion == Date.today + 2
          @rails_ga_11_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.ga_11_completion == Date.today + 1
          @rails_ga_11_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.ga_11_completion == Date.today
          @rails_ga_11_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.ga_11_completion < Date.today
          @rails_ga_11_completion = "完了予定日を過ぎています"
        else
          @rails_ga_11_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.do_1_completion
      if current_user_rubyonrails.do_1 != true
        if current_user_rubyonrails.do_1_completion == Date.today + 3
          @rails_do_1_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.do_1_completion == Date.today + 2
          @rails_do_1_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.do_1_completion == Date.today + 1
          @rails_do_1_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.do_1_completion == Date.today
          @rails_do_1_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.do_1_completion < Date.today
          @rails_do_1_completion = "完了予定日を過ぎています"
        else
          @rails_do_1_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.do_2_completion
      if current_user_rubyonrails.do_2 != true
        if current_user_rubyonrails.do_2_completion == Date.today + 3
          @rails_do_2_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.do_2_completion == Date.today + 2
          @rails_do_2_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.do_2_completion == Date.today + 1
          @rails_do_2_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.do_2_completion == Date.today
          @rails_do_2_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.do_2_completion < Date.today
          @rails_do_2_completion = "完了予定日を過ぎています"
        else
          @rails_do_2_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.do_3_completion
      if current_user_rubyonrails.do_3 != true
        if current_user_rubyonrails.do_3_completion == Date.today + 3
          @rails_do_3_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.do_3_completion == Date.today + 2
          @rails_do_3_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.do_3_completion == Date.today + 1
          @rails_do_3_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.do_3_completion == Date.today
          @rails_do_3_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.do_3_completion < Date.today
          @rails_do_3_completion = "完了予定日を過ぎています"
        else
          @rails_do_3_completion = ""
        end
      end
    end

    current_user_rubyonrails = current_user.rubyonrails_status
    if current_user_rubyonrails.do_4_completion
      if current_user_rubyonrails.do_4 != true
        if current_user_rubyonrails.do_4_completion == Date.today + 3
          @rails_do_4_completion = "完了予定日まであと3日です"
        elsif current_user_rubyonrails.do_4_completion == Date.today + 2
          @rails_do_4_completion = "完了予定日まであと2日です"
        elsif current_user_rubyonrails.do_4_completion == Date.today + 1
          @rails_do_4_completion = "完了予定日まであと1日です"
        elsif current_user_rubyonrails.do_4_completion == Date.today
          @rails_do_4_completion = "今日が完了予定日です"
        elsif current_user_rubyonrails.do_4_completion < Date.today
          @rails_do_4_completion = "完了予定日を過ぎています"
        else
          @rails_do_4_completion = ""
        end
      end
    end

    # Rails Tutorialのパート
    current_user_railstutorial = current_user.railstutorial_status
    if current_user_railstutorial.schedule_date
      if (current_user_railstutorial.chapter1 && current_user_railstutorial.chapter2 && 
        current_user_railstutorial.chapter3 && current_user_railstutorial.chapter4 && 
        current_user_railstutorial.chapter5 && current_user_railstutorial.chapter6 && 
        current_user_railstutorial.chapter7 && current_user_railstutorial.chapter8 &&
        current_user_railstutorial.chapter9 && current_user_railstutorial.chapter10 ) != true
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
    if current_user.free_engineer_user && current_user.venture_user
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
    elsif current_user.free_engineer_user
      last_movie_id = MovieCategory.where(must_view: true).where(subject: 'free').order('sort_order').last.movies.order('sort_order').last.id
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
    elsif current_user.venture_user
      last_movie_id = MovieCategory.where(must_view: true).where(subject: 'venture').order('sort_order').last.movies.order('sort_order').last.id
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
  end

  private

    def set_movie_categories
      @categories_all = MovieCategory.all.order('sort_order')
    end

    def movie_schedule_date
      link = "<a href=\"#{url_for(current_user)}\"> こちらから</a>"
      if current_user.user_movie_status.schedule_date.nil?
        flash.now[:danger] = "動画視聴の完了予定日を入力して下さい#{link}".html_safe
      end
    end

    def progate_comp_date 
      if movie_comp? && progate_completion?
        flash[:danger] = "プログラミング基礎編の完了予定日を入力して下さい"
        redirect_to current_user
      end
    end

    def railstutorial_comp_date
      if progate_compd? && railstutorial_completion?
        flash[:danger] = "誰でも分かる勤怠システムの完了予定日を入力して下さい"
        redirect_to current_user
      end
    end

    def portfolio_comp_path
      # if railstutorial_comp? && portfolio_completion?
      #   flash[:danger] = "ポートフォリオのURLを登録して下さい"
      #   redirect_to edit_user_path(current_user)
      # end
    end
end
