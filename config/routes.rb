Rails.application.routes.draw do
  # devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
    get 'users/roles/new' => 'roles#new'
    post 'users/roles' => 'roles#create'
  end

  resources :users, only: [:index, :show]

  resources :brands, only: [:index, :show] do
    resources :campaigns
  end

  resources :influencers, only: [:index, :show] do
    resources :campaigns, only: [:show]
    resources :requests, only: [:update]
  end

  resources :campaigns, only: [:show] do
    resources :rewards
    resources :requests, only: [:create, :destroy]
  end
 
  resources :influencers, only: [:index, :show]

  root 'welcome#index'
  get 'welcome/index'

  get 'welcome/user_recent_media' => 'welcome#user_recent_media', as: :user_recent_media
  get 'welcome/influencers' => 'welcome#influencers', as: :influencers_list

end
