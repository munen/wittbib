# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

describe "Books", :js => true do
  context "Lending" do
    before(:each) do
      log_in
    end

    it 'should be possible to lend a book' do
      @book = Factory :book
      @customer = Factory :customer
      visit root_path

      # Click auf "Leihen"
      find(".lend").click
      # Choose a customer
      select(@customer.name, :from => 'lending_customer_id')
      # Lend the book
      click_button 'lending_submit'
      page.should have_content("Buch ausgeliehen")
    end

    it 'should not be possible to lend a book twice' do
      @book = Factory :book
      @customer = Factory :customer
      Factory :lending, :book => @book, :customer => @customer

      visit root_path
      # Click auf "Leihen"
      find(".lend").click
      page.should have_content("Bereits ausgeliehen")
    end
  end
end
