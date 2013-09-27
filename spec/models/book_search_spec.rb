require 'spec_helper'
require 'vcr'

describe BookSearch do

  it 'searches books through google api' do
    VCR.use_cassette "google_isbn_search" do
      bs = BookSearch.new
      bs.search_google "1934356980"

      bs.isbn_13.should eq("9781934356982")
      bs.title.should eq("Practical Vim: Edit Text at the Speed of Thought")
      bs.authors.should eq("Drew Neil")

      # google has more on this book than amazon
      bs.description.should_not be_nil
      bs.language.should_not be_nil
    end
  end

  it 'searches books through amazon product advertising api' do
    VCR.use_cassette "amazon_isbn_search", :match_requests_on => [:host] do
      bs = BookSearch.new
      bs.search_amazon "1934356980"

      bs.isbn_10.should eq("1934356980")
      bs.authors.should eq("Drew Neil")
      bs.title.should eq("Practical Vim: Edit Text at the Speed of Thought (Pragmatic Programmers)")

      # amazon has less on this book than google
      bs.description.should be_nil
      bs.language.should be_nil
    end
  end

  it 'combines google and amazon results' do
    VCR.use_cassette "amazon_isbn_search", :match_requests_on => [:host] do
      VCR.use_cassette "google_isbn_search" do
        bs = BookSearch.new
        bs.search "1934356980"

        bs.description.should =~ /speed and efficiency/
        bs.language.should eq("en")
      end
    end
  end


end
