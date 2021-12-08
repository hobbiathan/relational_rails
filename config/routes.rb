Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  # Index (User story 1)
  
  get '/warrooms', to: 'warrooms#index'
  get '/warrooms/:id', to: 'warrooms#show'
  get '/warrooms/:id/edit', to: 'warrooms#edit'

  patch '/warrooms/:id', to: 'warrooms#update'

  delete '/warrooms/:id', to: 'warrooms#destroy'

  # Note: Order of routes matters!

  get '/countries', to: 'countries#index'
  get '/countries/new', to: 'countries#new'
  get '/countries/:id', to: 'countries#show'
  get '/countries/:id/edit', to: 'countries#edit'

  post '/countries', to: 'countries#create'
  # Should be PATCH, doesn't make sense
  patch '/countries/:id', to: 'countries#update'

  delete '/countries/:id', to: 'countries#destroy'

  get '/countries/:id/warrooms', to: 'country_warrooms#index'
  get '/countries/:id/warrooms/new', to: 'country_warrooms#new'
  get '/countries/:id/warrooms/:warroom_id', to: 'country_warrooms#show'
  get '/countries/:id/warrooms/:warroom_id/edit', to: 'country_warrooms#edit'

  post '/countries/:id/warrooms', to: 'country_warrooms#create'

  patch '/countries/:id/warrooms/:warroom_id', to: 'country_warrooms#update'

  delete '/countries/:id/warrooms/:warroom_id', to: 'country_warrooms#destroy'

  ## Companies 
  
  get '/companies', to: 'companies#index'

  get '/companies/new', to: 'companies#new'
  post '/companies', to: 'companies#create'
  # Specific parent in index

  get '/companies/:id', to: 'companies#show', as: :company
  get '/companies/:id/edit', to: 'companies#edit'
  patch '/companies/:id', to: 'companies#update'
  delete '/companies/:id', to: 'companies#destroy'

  get '/boardgames', to: 'boardgames#index'
  
  get '/boardgames/:id', to: 'boardgames#show'

  get '/boardgames/:id/edit', to: 'boardgames#edit'
  patch '/boardgames/:id', to: 'boardgames#update', as: "boardgame"

  delete '/boardgames/:id', to: 'boardgames#destroy'
  
  get '/companies/:company_id/boardgames', to: 'company_boardgames#index'
  get '/companies/:company_id/boardgames/new', to: 'company_boardgames#new'
  post '/companies/:company_id/boardgames', to: 'company_boardgames#create'
end
