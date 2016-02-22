Rails.application.routes.draw do
  root 'games#landing_page'

  #other resources remaining :index
  resources :games, only:[:show, :edit, :update, :new, :create, :destroy] do
    member do
      get :play
    end

    get 'my_games', on: :collection, :as => 'my'
  end

  resources :players, only:[:show, :edit, :update] do
    resources :uploads, only:[:new, :create, :edit, :update]
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
end
