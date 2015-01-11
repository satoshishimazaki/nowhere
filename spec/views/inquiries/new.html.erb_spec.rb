require 'spec_helper'

describe "inquiries/new" do
  before(:each) do
    assign(:inquiry, stub_model(Inquiry,
      :name => "MyString",
      :email => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new inquiry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", inquiries_path, "post" do
      assert_select "input#inquiry_name[name=?]", "inquiry[name]"
      assert_select "input#inquiry_email[name=?]", "inquiry[email]"
      assert_select "textarea#inquiry_content[name=?]", "inquiry[content]"
    end
  end
end
