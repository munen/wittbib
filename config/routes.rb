WittBib::Application.routes.draw do

  devise_for :users

  resources :customers
  resources :users

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
    member { put :toggle_archive }
  end
  resource :archive

  root :to => 'books#index'

  match '/exception_test' => 'exception_test#error'
end
