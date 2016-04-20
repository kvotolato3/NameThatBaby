Rails.application.routes.draw do
  root 'games#landing_page'

  #other resources remaining :index
  resources :games, only:[:show, :edit, :update, :new, :create, :destroy] do
    member do
      get :play
    end

    get 'my_games', on: :collection, :as => 'my'

    resources :players, only:[:new, :create]
  end

  resources :players, only:[:show, :edit, :update, :destroy] do
    resources :uploads, only:[:new, :create]
  end

  get '/users/email_lookup', :to => 'users#email_lookup', :as => 'email_lookup'
  get '/users/guest_sign_in', :to => 'guest_sessions#new', :as => 'new_guest_session'
  get '/users/guest/:id', :to => 'users#guest', :as => 'guest'

  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
end
