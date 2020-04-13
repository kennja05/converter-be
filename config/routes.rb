Rails.application.routes.draw do
  get '/countries/codes/:code', to: 'countries#codeShow'
  get '/countries/historical/rates/:base/:symbol/:start_date/', to: 'countries#historicalRates'
  get '/countries/convert/:from/:to/:amount', to: 'countries#convert'
  resources :countries, only: [:index, :show]
end
