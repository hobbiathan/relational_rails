Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  # Index (User story 1)
  get '/warrooms', to: 'warrooms#index'
  get '/warrooms/:id', to: 'warrooms#show'
  get '/warrooms/:id/edit', to: 'warrooms#edit'

  patch '/warrooms/:id', to: 'warrooms#update'

  # Note: Order of routes matters!

  get '/countries', to: 'countries#index'
  get '/countries/new', to: 'countries#new'
  get '/countries/:id', to: 'countries#show'
  get '/countries/:id/edit', to: 'countries#edit'

  post '/countries', to: 'countries#create'
  # Should be PATCH, doesn't make sense
  patch '/countries/:id', to: 'countries#update'



  get '/countries/:id/warrooms', to: 'country_warrooms#index'
  get '/countries/:id/warrooms/new', to: 'country_warrooms#new'
  get '/countries/:id/warrooms/:warroom_id', to: 'country_warrooms#show'
  get '/countries/:id/warrooms/:warroom_id/edit', to: 'country_warrooms#edit'

  post '/countries/:id/warrooms', to: 'country_warrooms#create'

  patch '/countries/:id/warrooms/:warroom_id', to: 'country_warrooms#update'

end
