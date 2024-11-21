Rails.application.routes.draw do
  get "prices/index"
  get "markets/index"
  get "markets/show"
  get "items/show"
  get "categories/index"
  get "categories/show"
  root "categories#index"

  resources :categories, only: %i[index show]
  resources :items, only: %i[show]
  resources :markets, only: %i[index show] do
    resources :prices, only: %i[index]
  end

  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

end
