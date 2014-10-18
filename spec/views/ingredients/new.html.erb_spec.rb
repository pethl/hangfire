require 'spec_helper'

describe "ingredients/new" do
  before(:each) do
    assign(:ingredient, stub_model(Ingredient,
      :name => "MyString",
      :category_id => 1
    ).as_new_record)
  end

  it "renders new ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ingredients_path, "post" do
      assert_select "input#ingredient_name[name=?]", "ingredient[name]"
      assert_select "input#ingredient_category_id[name=?]", "ingredient[category_id]"
    end
  end
end
