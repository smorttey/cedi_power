Rails.application.routes.draw do
  # Root route
  root "categories#index"

  # Resourceful routes for categories
  resources :categories, only: %i[index show], param: :id

  # Resourceful routes for items with SEO-friendly slugs
  resources :items, only: %i[show], param: :slug

  # Resourceful routes for markets with nested prices
  resources :markets, only: %i[index show], param: :slug do
    resources :prices, only: %i[index]
  end

  # User authentication
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

  # Add this line after your existing routes
  get '/sitemap.xml' => 'sitemap#index'
end
