WittBib::Application.routes.draw do

  resources :customers

  get "api/book/:isbn" => 'api/books#search'
  resources :books

  root :to => 'books#index'

  match '/exception_test' => 'exception_test#error'
end
