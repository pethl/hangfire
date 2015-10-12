require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :contact_person => "Contact Person",
        :marketing => false,
        :phone => "Phone",
        :email => "Email"
      ),
      stub_model(Order,
        :contact_person => "Contact Person",
        :marketing => false,
        :phone => "Phone",
        :email => "Email"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Person".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
