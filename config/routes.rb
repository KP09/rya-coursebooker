Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Active Admin routes
  ActiveAdmin.routes(self)

  # Root to the homepage
  root 'pages#home'

  # Devise
  devise_for :users
end
