class UserMailer < ActionMailer::Base
  default from: "noreply@omnomn.com"

  def welcome_email(user)
    @user = user
    @url  = "http://tethrball.com"
    mail(:to => user.email, :subject => "You're on your way to great networking")
  end


  def post_collect(user)
    @user = user
    @url  = "http://tethrball.com"
    mail(:to => user.email, :subject => "You've just been collected!")
  end
end
