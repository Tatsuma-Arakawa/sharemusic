Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  root 'pages#home'
  get 'pages/index'
end
