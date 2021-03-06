require 'spec_helper'

describe "plates/index" do
  before(:each) do
    assign(:plates, [
      stub_model(Plate,
        :price => "9.99",
        :name => "Name",
        :category_id => 1
      ),
      stub_model(Plate,
        :price => "9.99",
        :name => "Name",
        :category_id => 1
      )
    ])
  end

  it "renders a list of plates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
