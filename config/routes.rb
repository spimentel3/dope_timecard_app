Rails.application.routes.draw do

  root    'sessions#new'
  get     '/login',               to: 'sessions#new'
  post    '/login',               to: 'sessions#create'
  delete  '/logout',              to: 'sessions#destroy'
  get     '/password_resets',     to: 'password_resets#create'

  get     '/signup',              to: 'users#new'
  post    '/signup',              to: 'users#create'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :organizations,       only: [:new, :create, :show, :destroy] do
    post  'send_invites',         to: 'organizations#send_invites'
  end
end
