class ContactMailer < ActionMailer::Base

  default from: "contact-form@patchatech.com"

  def contact_mailer(params)
    @user_name = params[:name]
    @comments = params[:comments]
    @user_email = params[:email]
    mail(to: 'patchatech@gmail.com', subject: 'Contact Request')
  end

end
