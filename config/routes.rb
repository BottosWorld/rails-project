Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }
  
  resources :portfolios do
    resources :stocks
  end
  
  resources :watch_lists do
    resources :stocks
  end

  resources :stocks

  root to: "static#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
