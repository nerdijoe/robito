Rails.application.routes.draw do
  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'

  end
 
   resources :campaigns, only: [:index, :new, :create, :edit, :update, :destroy]

    
  root 'welcome#index'
  get 'welcome/index'

  get 'welcome/user_recent_media' => 'welcome#user_recent_media', as: :user_recent_media

end
