Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :restaurants do
    # /restaurants/:id/reviews/new
    resources :reviews, only: [:new, :create]

    # /restaurants/whatever-you-write-inside-the-collection-block
    collection do
      # verb path
      get :top
      # /restaurants/top
    end
    # /restaurants/:id/whatever-you-write-inside-the-member-block
    member do
      get :chef
    end
    # /restaurants/42/chef
  end

  resources :reviews, only: :destroy


end
