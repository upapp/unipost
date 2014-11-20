class UserMailer < ActionMailer::Base
  default from: "up.test.project.app@unifiedpost.com"
  
  def confirmation_email( user )
    @user = user
    mail(to: @user.email, subject: 'Registration details')
  end
end
