WittBib::Application.routes.draw do

  resources :customers

  get "api/books/:isbn" => 'api/books#search'
  resources :lendings, :only => [:index] do
    member { put :cancel, :as => :return_book }
  end
  resources :books do
    resources :lendings, :except => [:index]
    collection do
      get :search
      get :query
    end
  end

  root :to => 'books#index'

  match '/exception_test' => 'exception_test#error'
end
