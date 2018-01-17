 every 1.day, :at => '8:00 am' do
   rake "mail:judge_completion_date"
   rake "video_mail:judge_add_new_video"
 end