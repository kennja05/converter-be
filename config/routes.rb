Rails.application.routes.draw do
  get '/countries/codes/:code', to: 'countries#codeShow'
  resources :countries, only: [:index, :show]
end
