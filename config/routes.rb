Rails.application.routes.draw do
  root 'players#index'
  get 'games/:id' => 'games#show'
  get 'play_games/:id' => 'games#play', as: :game_play
end
