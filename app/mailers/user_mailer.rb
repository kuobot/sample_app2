class UserMailer < ActionMailer::Base
  default from: "noreply@omnomn.com"

  def welcome_email(user)
    @user = user
    @url  = "http://omnomn.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
