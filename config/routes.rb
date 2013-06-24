UserProfile::Application.routes.draw do
  resources :addresses


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :addresses
  end
end
