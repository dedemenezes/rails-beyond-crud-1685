Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check


  resources :restaurants do
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

    # If inside the block, this means that it is a NESTED resource
    # Which means:
    # It starts with parent_resources/:parent_resources_id/the-normal-route
    # /restaurants/:restaurant_id/reviews/new
    # /restaurants/:restaurant_id/reviews
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: :destroy


end
