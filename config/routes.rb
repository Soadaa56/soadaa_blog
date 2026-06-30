Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :posts

  get "feed", to: "posts#feed", defaults: { format: :atom }
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  get "updates", to: "pages#updates"

  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end
