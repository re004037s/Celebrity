namespace :mail do
    desc "現在日付と完了予定日を比較"
    task :judge_completion_date => :environment do 
        @users = User.all
        @users.each do |user|
            
            no_complete_tasks = []
            
            if user.html_css_status.try(:schedule_date).present?
                if user.html_css_status.schedule_date < Date.today
                    no_complete_tasks << "Progate(HTML&CSS)"
                end
            end

            if user.javascript_status.try(:schedule_date).present?          
                if user.javascript_status.schedule_date < Date.today
                    no_complete_tasks << "Progate(Javascript)"
                end
            end

            if user.ruby_status.try(:schedule_date).present?            
                if user.ruby_status.schedule_date < Date.today
                    no_complete_tasks << "Progate(Ruby)"
                end
            end

            if user.rubyonrails_status.try(:schedule_date).present?            
                if user.rubyonrails_status.schedule_date < Date.today
                    no_complete_tasks << "Progate(RubyonRails)"
                end
            end

            if user.user_movie_status.try(:schedule_date).present?            
                if user.user_movie_status.schedule_date < Date.today
                    no_complete_tasks << "動画視聴"
                end
            end
            
            UserMailer.alert_completion_date(user,no_complete_tasks).deliver_now if no_complete_tasks.present?
        end
    end    
end
