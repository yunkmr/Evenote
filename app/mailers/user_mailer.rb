class UserMailer < ApplicationMailer

  def notify_user
    # default to: -> { User.pluck(:email) }
    users =  User.pluck(:email)
    mail(subject: "veryday Bookers!yay!", bcc: users)
  end

  # def send_mail(mail_title,mail_content,users) #メソッドに対して引数を設定
  #   @mail_title = mail_title
  #   @mail_content = mail_content
  #   # binding.pry
  #   mail bcc: User.pluck(:email), subject: mail_title
  # end

end
