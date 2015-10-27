require 'spec_helper'

describe "faqs/show" do
  before(:each) do
    @faq = assign(:faq, stub_model(Faq,
      :title => "Title",
      :string, => "String,",
      :desc => "Desc",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/String,/)
    rendered.should match(/Desc/)
    rendered.should match(/Text/)
  end
end
