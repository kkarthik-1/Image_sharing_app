Rails.application.routes.draw do
  get "home/allalbum",to: "home#all_album"
  resources :home
  resources :photos
  devise_for :users
  resources :albums do
    resources :photos
  end
  root "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
