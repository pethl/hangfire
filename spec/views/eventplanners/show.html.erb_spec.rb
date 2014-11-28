require 'spec_helper'

describe "eventplanners/show" do
  before(:each) do
    @eventplanner = assign(:eventplanner, stub_model(Eventplanner,
      :name => "Name",
      :category_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
