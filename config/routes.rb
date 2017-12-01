Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  resources :mini_games
  resources :rooms do
    get 'start_game', to: 'rooms#start_game', as: :start_game
  end
  post 'rooms/stop_server', to: 'rooms#stop_server', as: :stop_server
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
