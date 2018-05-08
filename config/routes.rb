Rails.application.routes.draw do

  root    'sessions#new'
  get     '/login',               to: 'sessions#new'
  post    '/login',               to: 'sessions#create'
  delete  '/logout',              to: 'sessions#destroy'
  get     '/password_resets',     to: 'password_resets#create'

  get     '/signup',              to: 'users#new'
  post    '/signup',              to: 'users#create'
  resources :users do
    get   '/timecard_collection', to: 'users#timecard_collection'
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :organizations,       only: [:new, :create, :show, :destroy] do
    post  'send_invites',                   to: 'organizations#send_invites'
    post  'collect_timecards',              to: 'organizations#collect_timecards'
    post  'notify_users_timecards_are_due', to: 'organizations#notify_users_timecards_are_due'
    get   'view_week',                      to: 'organizations#view_week'
    get   'get_week_stats',                 to: 'organizations#get_week_stats'

    resources :timebook,          only: [:show, :new, :index]
    resources :timecard,          only: [:edit]
  end

  resources :timecard,            only: [:new, :create, :show, :update] do
    get  'lock',                 to: 'timecard#lock'
    get  'unlock',               to: 'timecard#unlock'
  end
end
