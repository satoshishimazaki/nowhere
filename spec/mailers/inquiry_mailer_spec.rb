require "spec_helper"

describe InquiryMailer do
  describe "send_mail" do
    let(:mail) { InquiryMailer.send_mail }

    it "renders the headers" do
      mail.subject.should eq("Send mail")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
