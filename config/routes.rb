Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/distribution_centers', to: 'distribution_centers#index'
  get '/distribution_centers/new', to: 'distribution_centers#new'
  post '/distribution_centers/', to: 'distribution_centers#create'
  get '/distribution_centers/:id', to: 'distribution_centers#show'
  get '/distribution_centers/:id/edit', to: 'distribution_centers#edit'
  patch '/distribution_centers/:id', to: 'distribution_centers#update'
  delete '/distribution_centers/:id', to: 'distribution_centers#destroy'
  get '/stores', to: 'stores#index'
  get 'distribution_centers/:id/stores', to: 'distribution_centers_stores#index'
  get 'stores/:id', to: 'stores#show', as: 'store_show'
  get '/distribution_centers/:id/stores/new', to: 'distribution_centers_stores#new'
  post '/distribution_centers/:id/stores/', to: 'distribution_centers_stores#create'
  get 'stores/:id/edit', to: 'stores#edit', as: 'store_edit'
  patch 'stores/:id', to: 'stores#update'
  delete 'stores/:id', to: 'stores#destroy'
end
