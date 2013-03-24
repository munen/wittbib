# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

describe "Books", :js => true do
  context 'New Book' do
    before(:each) do
      log_in
    end

    it 'fetches metadata from the Internet and creates a new book', :driver => :selenium do
      visit root_path
      fill_in 'query', :with => '9781161433197'
      sleep 2
      current_path.should == book_path(:id => 1)
      page.should have_content "Musashi Miyamoto"
      page.should have_content "Go Rin No Sho"
    end

  end
  context 'Archive' do
    before(:each) do
      log_in
    end

    it 'archives a book and does not show it in catalogue anymore' do
      @book = Factory :book
      visit root_path
      page.should have_content(@book.title)

      # Archive link for first book
      find(:xpath, "//table/tbody/tr/td[7]/a").click
      page.should have_content("Buch erfolgreich archiviert ")
      current_path.should == books_path
      page.should_not have_content(@book.title)
    end

    it 'puts an archived book back into the catalogue' do
      @book = Factory :book, :archived => true
      visit archive_path

      # Unarchive link for first book
      find(:xpath, "//tbody/tr/td[3]/a").click
      page.should have_content("Buch erfolgreich in den Katalog genommen ")
      current_path.should == books_path
      page.should have_content(@book.title)

      visit archive_path
      page.should_not have_content(@book.title)
    end

  end
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
      click_button 'Leihe Buch aus'
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

  context "Catalogue" do
    context "Anonymous" do
      it 'should not show modifier links' do
        Factory :book
        visit root_path
        find(:xpath, "//table/tbody/tr/td[4]/a[2]").should_not be_visible
        find(:xpath, "//table/tbody/tr/td[6]/a").should_not be_visible
        find(:xpath, "//table/tbody/tr/td[7]/a").should_not be_visible
        find(:xpath, "//table/tbody/tr/td[8]/a").should_not be_visible
      end
    end
    context "Logged in" do
      it 'should show modifier links' do
        Factory :book
        log_in
        visit root_path
        find(:xpath, "//table/tbody/tr/td[4]/a[2]").should be_visible
        find(:xpath, "//table/tbody/tr/td[6]/a").should be_visible
        find(:xpath, "//table/tbody/tr/td[7]/a").should be_visible
        find(:xpath, "//table/tbody/tr/td[8]/a").should be_visible
      end

    end
  end
end
