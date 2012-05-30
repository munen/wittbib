WittBib::Application.routes.draw do

  get "api/book/:isbn" => 'api/books#search'

  root :to => 'posts#index'
  resources :posts

  match '/exception_test' => 'exception_test#error'
end
