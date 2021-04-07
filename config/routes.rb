Rails.application.routes.draw do
  resources :contacts
  root to: "home#index"

  devise_for :users, controllers: {
                       sessions: "users/sessions",
                     }
end
