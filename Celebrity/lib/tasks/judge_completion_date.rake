require 'date'
namespace :judge_completion_date do
    desc "現在日付と完了予定日を比較"
    task :judge do
        @users = User.all
        no_complete_flg = [0,0,0,0,0]
        @users.each do |user|
            if user.html_css_status.try(:schedule_date) < Date.today
                puts "aaa"
                no_complete_flg[0] = 1
            end
            
            if user.javascript_status.try(:schedule_date) < Date.today
                puts "bbb"
                no_complete_flg[1] = 1
            end
            
            if user.ruby_status.try(:schedule_date) < Date.today
                puts "ccc"
                no_complete_flg[2] = 1                
            end
            
            if user.rubyonrails_status.try(:schedule_date) < Date.today
                puts "ddd"
                no_complete_flg[3] = 1                
            end
            
            if user_movie_status.try(:schedule_date) < Date.today
                puts "eee"
                no_complete_flg[4] = 1                
            end
            
            
            UserMailer.alert_completion_date(user).deliver_now
            
        end
    end    
end
