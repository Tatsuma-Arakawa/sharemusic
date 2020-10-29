Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }
  resources :album_boards, only: [:show, :new] do
    collection {get "search"}
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources  :users, :only => [:show]
end
