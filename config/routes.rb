Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :portfolios do
    resources :stocks
  end
  
  resources :watch_lists do
    resources :stocks
  end

  resources :stocks

  get '/sort', to: "stocks#sort", as: 'sort'
  # get '/patients/:id', to: 'patients#show', as: 'patient'

  root to: "static#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
