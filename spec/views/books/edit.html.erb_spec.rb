require 'spec_helper'

describe "books/edit" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :author => "MyString",
      :title => "MyString",
      :isbn => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => books_path(@book), :method => "post" do
      assert_select "input#book_author", :name => "book[author]"
      assert_select "input#book_title", :name => "book[title]"
      assert_select "input#book_isbn", :name => "book[isbn]"
      assert_select "textarea#book_description", :name => "book[description]"
    end
  end
end
