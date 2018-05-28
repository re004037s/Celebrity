require "rails_helper"

RSpec.describe EventMailer, type: :mailer do
  describe "send_when_create" do
    let(:mail) { EventMailer.send_when_create }

    it "renders the headers" do
      expect(mail.subject).to eq("Send when create")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
