class InviteMailer < ActionMailer::Base
  default from: "inmemoriamdbc@gmail.com"

  def invite_email(email, memorial)
    mail(to: email,
         subject: "Mourn for the loss of #{memorial.deceased_name}") do |format|
      format.html { render 'invitation' }
      format.text { render 'invitation' }
    end
  end

  def existing_email(user, memorial)
    mail(to: user.email_address,
         subject: "Mourn for the loss of #{memorial.deceased_name}") do |format|
      format.html { render 'invitation' }
      format.text { render 'invitation' }
    end
  end
end
