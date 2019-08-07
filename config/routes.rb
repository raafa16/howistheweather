Rails.application.routes.draw do
  root 'home#geolocation'
  # post '/zipcode', to: 'home#zipcode'
  get '/zipcode', to: 'home#zipcode'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
