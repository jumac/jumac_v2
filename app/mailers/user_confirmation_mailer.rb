class UserConfirmationMailer < ActionMailer::Base
  default from: "justice_rubi@yahoo.com"

  def registration_confirmation(user)
    @user = user
    @verfication_code = user.verification_code
    mail :to => @user.email, :from => "justice_rubi@yahoo.com", :subject => "Account Verification"
  end
end
