module ApplicationHelper
  def progate_comp?
    if current_user.javascript_status.do_beginner && current_user.ruby_status.ga_5 && current_user.rubyonrails_status.do_4
      return true
    else
      return false
    end
  end
end
