Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :images, only: [:index]
  resources :favorites, only: [:create, :index]
end
