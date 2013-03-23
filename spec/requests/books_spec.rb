# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

describe "Books", :js => true do
  context "Lending" do
    before(:each) do
      log_in
      @book = Factory :book
      @customer = Factory :customer
    end

    it 'should be possible to lend a book' do
      visit root_path

      # Book should be in list anymore, because it is not yet lent
      page.should have_content(@book.title)

      # Click auf "Leihen"

      find(".lend").click
      # Choose a customer
      select(@customer.name, :from => 'lending_customer_id')
      # Lend the book
      click_button 'lending_submit'
      page.should have_content("Buch ausgeliehen")
    end
  end
end
