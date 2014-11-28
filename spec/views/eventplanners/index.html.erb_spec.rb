require 'spec_helper'

describe "eventplanners/index" do
  before(:each) do
    assign(:eventplanners, [
      stub_model(Eventplanner,
        :name => "Name",
        :category_id => 1
      ),
      stub_model(Eventplanner,
        :name => "Name",
        :category_id => 1
      )
    ])
  end

  it "renders a list of eventplanners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
