namespace :mail do
    desc "現在日付と完了予定日を比較"
    task :judge_completion_date => :environment do 
        @users = User.all
        @users.each do |user|
          
          no_complete_tasks = []
          
          st1 = user.html_css_status
          if st1.try(:schedule_date).present?
              if (st1.ga_beginner && st1.ga_middle &&
                  st1.ga_advanced && st1.do_beginner &&
                  st1.do_middle && st1.ga_advanced &&
                  st1.ji_1 && st1.ji_2) != true
                  if st1.schedule_date < Date.today
                      no_complete_tasks << "Progate(HTML&CSS)"
                  end        
              end
          end

          st2 = user.javascript_status
          if st2.try(:schedule_date).present?
              if (st2.ga_1 && st2.ga_2 &&
                  st2.ga_3 && st2.ga_4 &&
                  st2.do_1) != true
                  if st2.schedule_date < Date.today
                      no_complete_tasks << "Progate(Javascript)"
                  end        
              end
          end

          st3 = user.ruby_status
          if st3.try(:schedule_date).present?
              if (st3.ga_1 && st3.ga_2 &&
                  st3.ga_3 && st3.ga_4 &&
                  st3.ga_5) != true                
                  if st3.schedule_date < Date.today
                      no_complete_tasks << "Progate(Ruby)"
                  end        
              end
          end

          st4 = user.rubyonrails_status
          if st4.try(:schedule_date).present?
              if (st4.ga_1 && st4.ga_2 &&
                  st4.ga_3 && st4.ga_4 &&
                  st4.ga_5 && st4.ga_6 &&
                  st4.ga_7 && st4.ga_8 &&
                  st4.ga_9 && st4.ga_10 &&    
                  st4.ga_11 && st4.do_1 &&         
                  st4.do_2 && st4.do_3 &&   
                  st4.do_4) != true                       
                  if st4.schedule_date < Date.today
                      no_complete_tasks << "Progate(RubyonRails)"
                  end    
              end
          end

          st5 = user.railstutorial_status
          if st5.try(:schedule_date).present?
              if (st5.chapter1 && st5.chapter2 &&
                  st5.chapter3 && st5.chapter4 &&
                  st5.chapter5 && st5.chapter6 &&
                  st5.chapter7 && st5.chapter8 &&
                  st5.chapter9 && st5.chapter10 
                  ) != true
                  if st5.schedule_date < Date.today
                      no_complete_tasks << "Railsチュートリアル"
                  end
              end
          end
          
          if user.free_engineer_user && user.venture_user
            st6 = user.user_movie_status
            if st6.try(:schedule_date).present?
              last_movie = MovieCategory.where(must_view: true).order('sort_order').last.movies.order('sort_order').last
              if user.feedbacks.find_by(movie_id: last_movie.id).nil?
                if st6.schedule_date < Date.today
                  no_complete_tasks << "動画視聴"
                end
              end
            end
          elsif user.free_engineer_user
            st6 = user.user_movie_status
            if st6.try(:schedule_date).present?
              last_movie = MovieCategory.where(must_view: true).where(subject: 'free').order('sort_order').last.movies.order('sort_order').last
              if user.feedbacks.find_by(movie_id: last_movie.id).nil?
                if st6.schedule_date < Date.today
                  no_complete_tasks << "動画視聴"
                end
              end
            end
          elsif user.venture_user
            st6 = user.user_movie_status
            if st6.try(:schedule_date).present?
              last_movie = MovieCategory.where(must_view: true).where(subject: 'venture').order('sort_order').last.movies.order('sort_order').last
              if user.feedbacks.find_by(movie_id: last_movie.id).nil?
                if st6.schedule_date < Date.today
                  no_complete_tasks << "動画視聴"
                end
              end
            end
          end

          UserMailer.alert_completion_date(user,no_complete_tasks).deliver_now if no_complete_tasks.present?
        end
    end    
end
