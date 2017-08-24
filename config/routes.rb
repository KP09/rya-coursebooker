Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Devise
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Active Admin routes
  ActiveAdmin.routes(self)

  # Root to the homepage
  root 'pages#home'

  # School resources
  resources :schools, only: [:show] do
    # Nested within schools
    resources :courses, only: [:index]
    resources :course_presets
    resources :course_locations
    get '/dashboard', to: 'school_dashboard#index'
  end

end
