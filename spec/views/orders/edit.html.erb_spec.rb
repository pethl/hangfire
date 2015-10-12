require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :contact_person => "MyString",
      :marketing => false,
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_path(@order), "post" do
      assert_select "input#order_contact_person[name=?]", "order[contact_person]"
      assert_select "input#order_marketing[name=?]", "order[marketing]"
      assert_select "input#order_phone[name=?]", "order[phone]"
      assert_select "input#order_email[name=?]", "order[email]"
    end
  end
end
