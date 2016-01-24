Rails.application.routes.draw do
  root 'players#index'

  get 'games/:id' => 'games#show'
end
