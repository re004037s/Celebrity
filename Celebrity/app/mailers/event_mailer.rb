class EventMailer < ApplicationMailer

  def send_when_create(users,event)
       @new_event = event
       mail to: 'test@example.com', subject:  'セレブエンジニアサロンのイベントについて',bcc: users.map{|u| u.email}
  end
  
  def send_when_update(users,event)
       @new_event = event
       mail to: 'test@example.com', subject:  'セレブエンジニアサロンのイベントについて',bcc: users.map{|u| u.email}
  end
  
  def send_when_destroy(users,event)
       @new_event = event
       mail to: 'test@example.com', subject:  'セレブエンジニアサロンのイベントについて',bcc: users.map{|u| u.email}
  end
end
