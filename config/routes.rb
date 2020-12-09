Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/candy_shops', to: 'candy_shops#index'
  get '/candy_shops/new', to: 'candy_shops#new'
  post '/candy_shops', to: 'candy_shops#create'
  get '/candy_shops/:id', to: 'candy_shops#show'
  get '/candy_shops/:id/edit', to: 'candy_shops#edit'
  patch '/candy_shops/:id', to: 'candy_shops#update'
  delete '/candy_shops/:id', to: 'candy_shops#destroy'
  get '/candies', to: 'candies#index'
  get '/candy_shops/:id/candies', to: 'candy_shops_candies#index'
  get '/candies/:id', to: 'candies#show'
  get '/candy_shops/:id/candies/new', to: 'candy_shops_candies#new'
  post '/candy_shops/:id/candies', to: 'candy_shops_candies#create'
  get '/candies/:id/edit', to: 'candies#edit'
  patch '/candies/:id', to: 'candies#update'
  delete '/candies/:id', to: 'candies#destroy'

  get '/distribution_centers', to: 'distribution_centers#index'
  get '/distribution_centers/new', to: 'distribution_centers#new'
  post '/distribution_centers/', to: 'distribution_centers#create'
  get '/distribution_centers/:id', to: 'distribution_centers#show'
  get '/distribution_centers/:id/edit', to: 'distribution_centers#edit'
  patch '/distribution_centers/:id', to: 'distribution_centers#update'
  delete '/distribution_centers/:id', to: 'distribution_centers#destroy'
  get '/stores', to: 'stores#index'
  get 'distribution_centers/:id/stores', to: 'distribution_centers_stores#index'
end
