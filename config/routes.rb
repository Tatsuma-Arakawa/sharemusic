Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  resources :album_boards, only: [:index, :new] do
    resources :board_reviews, except: [:show]
    collection {get "search"}
  end

  resources :album_boards,  except: [:index, :new]
  resources :relationships,   only: [:create, :destroy]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  resources  :users, :only => [:show, :index] do
    member do
      get :following, :followers
    end
  end
end
