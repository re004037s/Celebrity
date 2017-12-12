namespace :mail do
    desc "現在日付と完了予定日を比較"
    task :judge_completion_date => :environment do 
        @users = User.all
        @users.each do |user|
            
            no_complete_tasks = []
            
            if user.html_css_status.try(:schedule_date).present?
                if (user.html_css_status.ga_beginner && user.html_css_status.schedule_date.ga_middle &&
                    user.html_css_status.schedule_date.ga_advanced && user.html_css_status.schedule_date.do_beginner &&
                    user.html_css_status.schedule_date.do_middle && user.html_css_status.schedule_date.ga_advanced &&
                    user.html_css_status.schedule_date.ji_1 && user.html_css_status.schedule_date.ji_2) != true
                    if user.html_css_status.schedule_date < Date.today
                        no_complete_tasks << "Progate(HTML&CSS)"
                    end        
                end
            end

            if user.javascript_status.try(:schedule_date).present?
                if (user.javascript_status.ga_beginner && user.javascript_status.ga_beginner) != true
                    if user.javascript_status.schedule_date < Date.today
                        no_complete_tasks << "Progate(Javascript)"
                    end        
                end
            end

            if user.ruby_status.try(:schedule_date).present?
                if (user.ruby_status.ga_1 && user.ruby_status.ga_2 &&
                    user.ruby_status.ga_3 && user.ruby_status.ga_4 &&
                    user.ruby_status.ga_5) != true                
                    if user.ruby_status.schedule_date < Date.today
                        no_complete_tasks << "Progate(Ruby)"
                    end        
                end
            end

            if user.rubyonrails_status.try(:schedule_date).present?
                if (user.rubyonrails_status.ga_1 && user.rubyonrails_status.ga_2 &&
                    user.rubyonrails_status.ga_3 && user.rubyonrails_status.ga_4 &&
                    user.rubyonrails_status.ga_5 && user.rubyonrails_status.ga_6 &&
                    user.rubyonrails_status.ga_7 && user.rubyonrails_status.ga_8 &&
                    user.rubyonrails_status.ga_9 && user.rubyonrails_status.ga_10 &&    
                    user.rubyonrails_status.ga_11 && user.rubyonrails_status.do_1 &&         
                    user.rubyonrails_status.do_2 && user.rubyonrails_status.do_3 &&   
                    user.rubyonrails_status.do_4) != true                       
                    if user.rubyonrails_status.schedule_date < Date.today
                        no_complete_tasks << "Progate(RubyonRails)"
                    end    
                end
            end

            if user.railstutorial_status.try(:schedule_date).present?
                if (user.railstutorial_status.chapter1 && user.railstutorial_status.chapter2 &&
                    user.railstutorial_status.chapter3 && user.railstutorial_status.chapter4 &&
                    user.railstutorial_status.chapter5 && user.railstutorial_status.chapter6 &&
                    user.railstutorial_status.chapter7 && user.railstutorial_status.chapter8 &&
                    user.railstutorial_status.chapter9 && user.railstutorial_status.chapter10 &&
                    user.railstutorial_status.chapter11 && user.railstutorial_status.chapter12 &&
                    user.railstutorial_status.chapter13 && user.railstutorial_status.chapter14) != true
                    if user.user_movie_status.schedule_date < Date.today
                        no_complete_tasks << "Railsチュートリアル"
                    end
                end
            end

            if user.user_movie_status.try(:schedule_date).present?
                @flg = 0
                @categories = Movie.all
                @categories.each do |category|
                    category.movies.order('sort_order').each do |movie|
                        feedback = user.feedbacks.find_by(movie_id: movie.id)
                        @flg = 1 if !feedback.present?
                    end
                end
                
                if @flg == 1
                    if user.user_movie_status.schedule_date < Date.today
                        no_complete_tasks << "動画視聴"
                    end
                end
            end
            
            UserMailer.alert_completion_date(user,no_complete_tasks).deliver_now if no_complete_tasks.present?
        end
    end    
end
