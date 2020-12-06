Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/distribution_centers', to: 'distribution_centers#index'
  get '/distribution_centers/new', to: 'distribution_centers#new'
  post '/distribution_centers/', to: 'distribution_centers#create'
  get '/distribution_centers/:id', to: 'distribution_centers#show'
  get '/distribution_centers/:id/edit', to: 'distribution_centers#edit'
  patch '/distribution_centers/:id', to: 'distribution_centers#update'
  delete '/distribution_centers/:id', to: 'distribution_centers#destroy'
end
