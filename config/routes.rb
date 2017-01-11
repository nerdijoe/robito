Rails.application.routes.draw do
  devise_for :users, class_name: 'FormUser'
  root 'welcome#index'
  get 'welcome/index'


end
