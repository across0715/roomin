class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "自信のメールアドレス@across0715@gmail.com", subject: "confirmation"
  end
end
