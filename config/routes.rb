Rails.application.routes.draw do
 devise_for :users
 
 'boards#index'


  resources :boards do
    resources :lists
  end

  resources :lists do
    resources :tasks
  end
end
