Rails.application.routes.draw do
  resources :cards
  get "up" => "rails/health#show", as: :rails_health_check
end
