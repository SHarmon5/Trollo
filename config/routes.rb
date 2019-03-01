Rails.application.routes.draw do
  'boards#index'

  devise_for :users



  resources :boards do
    resources :lists
  end

  resources :lists do
    resources :tasks
  end
end
