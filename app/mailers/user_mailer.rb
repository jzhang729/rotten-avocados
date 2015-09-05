class UserMailer < ActionMailer::Base
  default from: "jordanzhang@gmail.com"
  layout 'mailer'


  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email,
         subject: 'Welcome to My Awesome Site',
         template_path: 'notifications',
         template_name: 'another')
  end
  
end
