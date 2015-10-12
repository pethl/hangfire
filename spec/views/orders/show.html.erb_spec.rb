require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :contact_person => "Contact Person",
      :marketing => false,
      :phone => "Phone",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Person/)
    rendered.should match(/false/)
    rendered.should match(/Phone/)
    rendered.should match(/Email/)
  end
end
