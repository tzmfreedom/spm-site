Rails.application.routes.draw do
  root to: 'top#index'

  get '/packages/:id', to: 'packages#show', as: 'package'
  get '/search', to: 'top#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
