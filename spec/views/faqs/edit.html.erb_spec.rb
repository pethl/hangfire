require 'spec_helper'

describe "faqs/edit" do
  before(:each) do
    @faq = assign(:faq, stub_model(Faq,
      :title => "MyString",
      :string, => "MyString",
      :desc => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit faq form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", faq_path(@faq), "post" do
      assert_select "input#faq_title[name=?]", "faq[title]"
      assert_select "input#faq_string,[name=?]", "faq[string,]"
      assert_select "input#faq_desc[name=?]", "faq[desc]"
      assert_select "input#faq_text[name=?]", "faq[text]"
    end
  end
end
