require "rails_helper"

RSpec.describe TaskMailer, type: :mailer do
  describe "Checking contents" do
    let(:user) { create(:user) }
    let(:theme) { create(:theme) }
    let(:task) { create(:task) }
    let(:mail) { TaskMailer.with(user: user.id, task: task.id).create_task }

    it 'renders the subject' do
      expect(mail.subject).to eq("Task created")
    end

    it "renders the header - mail to" do
      expect(mail.to).to eq([user.email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Task: #{task.title} created")
    end
  end
end
