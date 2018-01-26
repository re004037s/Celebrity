 every 1.day, :at => '8:00 am' do
   rake "mail:judge_completion_date"
 end