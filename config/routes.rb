WittBib::Application.routes.draw do

  get "api/book/:isbn" => 'api/books#search'

  root :to => 'posts#index'

  match '/exception_test' => 'exception_test#error'
end
