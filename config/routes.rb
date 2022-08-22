Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :instruments do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :update]
  get "my_instruments", to: "instrument#my_instruments"
  # Defines the root path route ("/")
  # root "articles#index"
end
