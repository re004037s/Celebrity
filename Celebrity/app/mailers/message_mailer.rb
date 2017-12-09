class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.hello.subject
  #
  
  default from: 'r.takayama92@gmail.com'

  def hello
    @greeting = "Hi"
    mail to:      'ryota4afi@gmail.com',
         subject: 'Mail from MessageMailer'
  end
end
