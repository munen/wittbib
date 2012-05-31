WittBib::Application.routes.draw do

  resources :lendings

  resources :customers

  get "api/books/:isbn" => 'api/books#search'
  resources :books do
    collection do
      get :search
      get :query
    end
  end

  root :to => 'books#index'

  match '/exception_test' => 'exception_test#error'
end
