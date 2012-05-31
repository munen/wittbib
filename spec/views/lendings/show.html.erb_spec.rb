require 'spec_helper'

describe "lendings/show" do
  before(:each) do
    @lending = assign(:lending, stub_model(Lending,
      :book_id => 1,
      :customer_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
