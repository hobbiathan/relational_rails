Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  # Index (User story 1)






























  get '/companies', to: 'companies#index'

  get '/companies/new', to: 'companies#new'
  post '/companies', to: 'companies#create'
  # Specific parent in index

  get '/companies/:id', to: 'companies#show', as: :company
  get '/companies/:id/edit', to: 'companies#edit'
  patch '/companies/:id', to: 'companies#update'
  delete '/companies/:id', to: 'companies#destroy'

  get '/boardgames', to: 'boardgames#index'
  get '/wargames/:id', to: 'wargames#show'

  get '/boardgames/:id', to: 'boardgames#show'

  get '/boardgames/:id/edit', to: 'boardgames#edit'
  patch '/boardgames/:id', to: 'boardgames#update', as: "boardgame"

  delete '/boardgames/:id', to: 'boardgames#destroy'

  get '/companies/:company_id/boardgames', to: 'company_boardgames#index'
  get '/companies/:company_id/boardgames/new', to: 'company_boardgames#new'
  post '/companies/:company_id/boardgames', to: 'company_boardgames#create'
end
