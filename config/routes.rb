Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                     }
  root to: "home#index"

  resources :contacts
  resources :products
  resources :orders

  post "/admin/generate_user_pdf", to: "admin/generate_user_pdf#create", format: :pdf
end
