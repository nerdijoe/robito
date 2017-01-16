Rails.application.routes.draw do
  # devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
    get 'users/roles/new' => 'roles#new'
    post 'users/roles' => 'roles#create'
  end

  root 'landing_page#index'

  resources :users, only: [:index, :show]

  resources :brands, only: [:index, :show, :edit, :update, :destroy] do
    resources :campaigns
  end

  resources :influencers, only: [:index, :show, :edit, :update, :destroy] do
    resources :campaigns, only: [:show]
    resources :requests, only: [:update]
  end

  resources :campaigns, only: [:show] do
    resources :rewards
    resources :requests, only: [:create, :destroy, :show]
  end

  # resources :influencers, only: [:index, :show]

  resources :searches, only: [:new, :create, :show]

  get "/campaigns/:id/influencers" => "campaigns#influencers", as: 'see_influencers'
  get "/campaigns/:id/influencers/:influencer_id" => "campaigns#influencersposts", as: 'see_influencers_posts'

#   root 'welcome#index'

  get 'welcome/index'

  get 'welcome/user_recent_media' => 'welcome#user_recent_media', as: :user_recent_media
  get 'welcome/influencers' => 'welcome#influencers', as: :influencers_list

end
