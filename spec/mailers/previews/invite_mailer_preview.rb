# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview
  def send_invite
    InviteMailer.with(email: "student@qwerty.ru", password: 'qwerty').send_invite
  end
end
