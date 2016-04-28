class UserMailer < ApplicationMailer
  default from: 'your-pal@job-hunger.com'

  def welcome(user)
    @user = user
    mail(to: @user.uid, subject: 'Welcome to Job-Hunger')
  end
end
