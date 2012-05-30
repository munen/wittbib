WittBib::Application.routes.draw do

  resources :customers

  get "api/books/:isbn" => 'api/books#search'
  resources :books

  root :to => 'books#index'

  match '/exception_test' => 'exception_test#error'
end
