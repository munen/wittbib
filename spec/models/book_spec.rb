require 'spec_helper'

describe Book do
  it 'responds to to_s' do
    book = Factory :book, :title => "foo", :authors => "bar"
    book.to_s.should == "bar - foo"
  end
end
