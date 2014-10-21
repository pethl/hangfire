require 'spec_helper'

describe "productitems/edit" do
  before(:each) do
    @productitem = assign(:productitem, stub_model(Productitem,
      :product_id => 1,
      :ingredient_id => 1,
      :volume => "9.99"
    ))
  end

  it "renders the edit productitem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", productitem_path(@productitem), "post" do
      assert_select "input#productitem_product_id[name=?]", "productitem[product_id]"
      assert_select "input#productitem_ingredient_id[name=?]", "productitem[ingredient_id]"
      assert_select "input#productitem_volume[name=?]", "productitem[volume]"
    end
  end
end
