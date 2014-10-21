require 'spec_helper'

describe "productitems/index" do
  before(:each) do
    assign(:productitems, [
      stub_model(Productitem,
        :product_id => 1,
        :ingredient_id => 2,
        :volume => "9.99"
      ),
      stub_model(Productitem,
        :product_id => 1,
        :ingredient_id => 2,
        :volume => "9.99"
      )
    ])
  end

  it "renders a list of productitems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
