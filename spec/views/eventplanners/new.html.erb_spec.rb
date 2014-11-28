require 'spec_helper'

describe "eventplanners/new" do
  before(:each) do
    assign(:eventplanner, stub_model(Eventplanner,
      :name => "MyString",
      :category_id => 1
    ).as_new_record)
  end

  it "renders new eventplanner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", eventplanners_path, "post" do
      assert_select "input#eventplanner_name[name=?]", "eventplanner[name]"
      assert_select "input#eventplanner_category_id[name=?]", "eventplanner[category_id]"
    end
  end
end
