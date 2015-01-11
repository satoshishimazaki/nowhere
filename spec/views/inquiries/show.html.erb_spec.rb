require 'spec_helper'

describe "inquiries/show" do
  before(:each) do
    @inquiry = assign(:inquiry, stub_model(Inquiry,
      :name => "Name",
      :email => "Email",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
  end
end
