Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/candy_shops', to: 'candy_shops#index'
  get '/candy_shops/new', to: 'candy_shops#new'
  get '/candy_shops/:id', to: 'candy_shops#show'
  post '/candy_shops', to: 'candy_shops#create'
end
