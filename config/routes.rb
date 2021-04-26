Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                     }
  scope "(:locale)", locale: /#{I18n.available_locales.map(&:to_s).join("|")}/ do
    # For details on the DSL available within this file, see
    resources :users
  end

  root to: "home#index"

  resources :contacts
  resources :products
  resources :orders

  post "/admin/generate_user_pdf", to: "admin/generate_user_pdf#create", format: :pdf
end
