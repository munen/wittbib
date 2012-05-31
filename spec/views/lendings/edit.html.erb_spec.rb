require 'spec_helper'

describe "lendings/edit" do
  before(:each) do
    @lending = assign(:lending, stub_model(Lending,
      :book_id => 1,
      :customer_id => 1
    ))
  end

  it "renders the edit lending form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lendings_path(@lending), :method => "post" do
      assert_select "input#lending_book_id", :name => "lending[book_id]"
      assert_select "input#lending_customer_id", :name => "lending[customer_id]"
    end
  end
end
