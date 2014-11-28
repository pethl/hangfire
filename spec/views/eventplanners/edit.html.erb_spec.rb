require 'spec_helper'

describe "eventplanners/edit" do
  before(:each) do
    @eventplanner = assign(:eventplanner, stub_model(Eventplanner,
      :name => "MyString",
      :category_id => 1
    ))
  end

  it "renders the edit eventplanner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", eventplanner_path(@eventplanner), "post" do
      assert_select "input#eventplanner_name[name=?]", "eventplanner[name]"
      assert_select "input#eventplanner_category_id[name=?]", "eventplanner[category_id]"
    end
  end
end
