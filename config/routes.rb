Rails.application.routes.draw do
  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  
  root 'welcome#index'
  get 'welcome/index'


end
