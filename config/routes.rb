Rails.application.routes.draw do
  resources :mini_games
  resources :rooms do
    get 'start_game', to: 'rooms#start_game', as: :start_game
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
