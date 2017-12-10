namespace :mail do
  desc '各ユーザに対して完了予定日を過ぎた学習項目をアラート'
  task deadline_alert: :environment do
    users = User.where(email: 'r.takayama92@gmail.com')
    
    users.each do |user|
      MessageMailer.deadline_alert(user).deliver
    end
  end
end