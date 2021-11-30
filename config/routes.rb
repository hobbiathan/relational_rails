Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  # Index (User story 1)
  get '/wargames', to: 'wargames#index'
  get '/boardgames', to: 'boardgames#index'

  # Specific parent in index
  get '/wargames/:id', to: 'wargames#show'
  get '/boardgames/:id', to: 'boardgames#show'

  get '/warrooms', to: 'warrooms#index'
  get '/boardgames', to: 'boardgames#index'

  get '/wargames/:id', to: 'wargames#show'
  get '/boardgames/:id', to: 'boardgames#show'

  get '/wargames/:id/warrooms', to: 'wargames#index'
  get '/boardgames/:id/boardgames', to: 'boardgames#index'

end
