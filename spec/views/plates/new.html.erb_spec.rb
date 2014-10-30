require 'spec_helper'

describe "plates/new" do
  before(:each) do
    assign(:plate, stub_model(Plate,
      :price => "9.99",
      :name => "MyString",
      :category_id => 1
    ).as_new_record)
  end

  it "renders new plate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", plates_path, "post" do
      assert_select "input#plate_price[name=?]", "plate[price]"
      assert_select "input#plate_name[name=?]", "plate[name]"
      assert_select "input#plate_category_id[name=?]", "plate[category_id]"
    end
  end
end
