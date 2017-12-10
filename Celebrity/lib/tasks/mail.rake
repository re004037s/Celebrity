namespace :mail do
    desc "現在日付と完了予定日を比較"
    task :judge_completion_date do
        @users = User.all
        no_complete_task = []
        @users.each do |user|
            if user.html_css_status.try(:schedule_date) < Date.today
                no_complete_task[] = "Progate(HTML&CSS)"
            end
            
            if user.javascript_status.try(:schedule_date) < Date.today
                no_complete_task[] = "Progate(Javascript)"
            end
            
            if user.ruby_status.try(:schedule_date) < Date.today
                no_complete_task[] = "Progate(Ruby)"
            end
            
            if user.rubyonrails_status.try(:schedule_date) < Date.today
                no_complete_task[] = "Progate(RubyonRails)"
            end
            
            if user_movie_status.try(:schedule_date) < Date.today
                no_complete_task[] = "動画視聴"
            end
            
            UserMailer.alert_completion_date(user,no_complete_task).deliver_now if !no_complete_task.nil
        end
    end    
end
