WittBib::Application.routes.draw do

  resources :books

  root :to => 'posts#index'

  match '/exception_test' => 'exception_test#error'
end
