class MessageMailer < ApplicationMailer
  default from: 'celebrityengineer.members@gmail.com'

  def deadline_alert(user)
    @name = user.nickname
    mail to: user.email,
    subject: 'Mail from セレブエンジニアサロン'
  end
end
