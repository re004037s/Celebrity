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
      sum += 1 if user.javascript_status.ga_beginner
      sum += 1 if user.javascript_status.do_beginner
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
  
  def percent_progate(user)
    sum = 0
    sum += count_html_css(user)
    sum += count_javascript(user)
    sum += count_ruby(user)
    sum += count_ruby_on_rails(user)
    return sum * 100 / 30
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
      sum += 1 if user.railstutorial_status.chapter11
      sum += 1 if user.railstutorial_status.chapter12
      sum += 1 if user.railstutorial_status.chapter13
      sum += 1 if user.railstutorial_status.chapter14
      return sum
    end
  end
  
  def percent_movie(user)
    c = user.feedbacks.count
    return c * 100 / Movie.count
  end

end