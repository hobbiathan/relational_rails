Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  # Index (User story 1)
  get '/countries', to: 'countries#index'
  get '/countries/:id', to: 'countries#show'
  get '/countries/:id/warrooms', to: 'countries#index'


end
