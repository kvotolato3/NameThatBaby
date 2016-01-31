Rails.application.routes.draw do
  root 'games#landing_page'
  #other resources remaining :index, :create, :destroy, :new
  resources :games, only:[:show, :edit, :update] do
    member do
      get :play
    end
  end

  resources :players, only:[:show, :edit, :update]

  devise_for :users
end
