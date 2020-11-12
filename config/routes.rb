Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  resources :album_boards, only: [:new] do
    resources :board_reviews, only: [:create, :destroy, :edit]
    collection {get "search"}
  end

  resources :album_boards,  except: [:new]
  resources :relationships,   only: [:create, :destroy]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  resources  :users, :only => [:show] do
    get :search, on: :collection
    member do
      get :following, :followers
    end
  end
end
