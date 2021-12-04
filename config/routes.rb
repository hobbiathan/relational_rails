Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  # Index (User story 1)
  get '/wargames', to: 'wargames#index'
  get '/companies', to: 'companies#index'

  get '/companies/new', to: 'companies#new'
  post '/companies', to: 'companies#create'
  # Specific parent in index
  get '/wargames/:id', to: 'wargames#show'
  get '/companies/:id', to: 'companies#show', as: :company
  get '/companies/:id/edit', to: 'companies#edit'
  patch '/companies/:id', to: 'companies#update'
  delete '/companies/:id', to: 'companies#destroy'
  get '/warrooms', to: 'warrooms#index'
  get '/boardgames', to: 'boardgames#index'

  get '/wargames/:id', to: 'wargames#show'
  get '/boardgames/:id', to: 'boardgames#show'
  get '/boardgames/:id/edit', to: 'boardgames#edit'
  patch '/boardgames/:id', to: 'boardgames#update'
  get '/wargames/:id/warrooms', to: 'wargames#index'
  get '/companies/:company_id/boardgames', to: 'company_boardgames#index'
  get '/companies/:company_id/boardgames/new', to: 'company_boardgames#new'
  post '/companies/:company_id/boardgames', to: 'company_boardgames#create'
end
