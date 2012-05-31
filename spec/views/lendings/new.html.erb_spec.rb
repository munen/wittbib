require 'spec_helper'

describe "lendings/new" do
  before(:each) do
    assign(:lending, stub_model(Lending,
      :book_id => 1,
      :customer_id => 1
    ).as_new_record)
  end

  it "renders new lending form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lendings_path, :method => "post" do
      assert_select "input#lending_book_id", :name => "lending[book_id]"
      assert_select "input#lending_customer_id", :name => "lending[customer_id]"
    end
  end
end
