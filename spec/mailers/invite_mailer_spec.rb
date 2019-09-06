require "rails_helper"

RSpec.describe InviteMailer, type: :mailer do
  describe "Checking contents" do
    let(:mail) { InviteMailer.with(email: "student@qwerty.ru", password: 'qwerty').send_invite }

    it 'renders the subject' do
      expect(mail.subject).to eq("Welcome")
    end

    it "renders the header - mail to" do
      expect(mail.to).to eq(["student@qwerty.ru"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Нажмите, чтобы продолжить")
    end
  end
end
