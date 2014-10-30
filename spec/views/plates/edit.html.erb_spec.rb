require 'spec_helper'

describe "plates/edit" do
  before(:each) do
    @plate = assign(:plate, stub_model(Plate,
      :price => "9.99",
      :name => "MyString",
      :category_id => 1
    ))
  end

  it "renders the edit plate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", plate_path(@plate), "post" do
      assert_select "input#plate_price[name=?]", "plate[price]"
      assert_select "input#plate_name[name=?]", "plate[name]"
      assert_select "input#plate_category_id[name=?]", "plate[category_id]"
    end
  end
end
