Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/distribution_centers', to: 'distribution_centers#index'
  get '/distribution_centers/:id', to: 'distribution_centers#show'
end
