require 'spec_helper'

describe "inquiries/index" do
  before(:each) do
    assign(:inquiries, [
      stub_model(Inquiry,
        :name => "Name",
        :email => "Email",
        :content => "MyText"
      ),
      stub_model(Inquiry,
        :name => "Name",
        :email => "Email",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of inquiries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
