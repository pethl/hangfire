require 'spec_helper'

describe "faqs/index" do
  before(:each) do
    assign(:faqs, [
      stub_model(Faq,
        :title => "Title",
        :string, => "String,",
        :desc => "Desc",
        :text => "Text"
      ),
      stub_model(Faq,
        :title => "Title",
        :string, => "String,",
        :desc => "Desc",
        :text => "Text"
      )
    ])
  end

  it "renders a list of faqs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "String,".to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
