require 'spec_helper'

describe BooksController do
  include Devise::TestHelpers

  before(:each) do
    @user = Factory :user
    sign_in @user
  end


  it 'deletes a book' do
    book = Factory :book
    Book.count == 1
    delete :destroy, :id => 1
    Book.count == 0
  end

end
