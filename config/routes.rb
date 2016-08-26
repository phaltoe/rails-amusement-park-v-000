Rails.application.routes.draw do
  resources :users

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'sign_out' => 'sessions#destroy'

  root 'welcome#home'

  resources :attractions

  resources :rides, only: :create

end