require 'spec_helper'

describe "plates/show" do
  before(:each) do
    @plate = assign(:plate, stub_model(Plate,
      :price => "9.99",
      :name => "Name",
      :category_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
