Rails.application.routes.draw do
  root 'players#index'
  #other resources remaining :index, :create, :destroy, :new
  resources :games, only:[:show, :edit, :update] do
    member do
      get :play
    end
  end
end
