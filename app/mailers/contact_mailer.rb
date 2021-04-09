class ContactMailer < ApplicationMailer
  def contact_mail(contact_params)
    @room_number = contact_params[:room_number]
    @name = contact_params[:name]
    @content = contact_params[:content]
    @filename = "#{Time.current.to_i}_#{@room_number}_#{@name}.jpg"
    attachments.inline[@filename] = File.read(contact_params[:image])
    mail to: "hotelのメールアドレス@across0715@gmail.com",
         subject: "お問い合わせ(#{@room_number}:#{@name})"
  end
end
