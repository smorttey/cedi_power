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

  # User authentication (using Devise for session handling)
  devise_for :users

  # Admin-specific routes
  namespace :admin do
    get "dashboard", to: "dashboard#index", as: :dashboard
    resources :users
    resources :categories
    resources :items
    resources :markets
  end

  # Store owner-specific routes
  namespace :store_owner do
    get "dashboard", to: "dashboard#index", as: :dashboard
    resources :prices
    resources :markets
  end

  # Saved Items for general users
  resources :saved_items, only: %i[index create destroy]

  # Sitemap for SEO
  get '/sitemap.xml', to: 'sitemap#index', format: :xml
  get '/sitemaps/:file.xml', to: 'sitemap#index', format: :xml
end
