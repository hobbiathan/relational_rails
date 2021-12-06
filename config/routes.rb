Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  # Index (User story 1)
  get '/warrooms', to: 'warrooms#index'
  get '/warrooms/:id', to: 'warrooms#show'

  # Note: Order of routes matters!

  get '/countries', to: 'countries#index'
  get '/countries/new', to: 'countries#new'
  get '/countries/:id', to: 'countries#show'
  get '/countries/:id/edit', to: 'countries#edit'

  post '/countries', to: 'countries#create'

  get '/countries/:id/warrooms', to: 'country_warrooms#index'
  get '/countries/:id/warrooms/:warroom_id', to: 'country_warrooms#show'



end
