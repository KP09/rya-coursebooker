Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Devise
  devise_for :users

  # Active Admin routes
  ActiveAdmin.routes(self)

  # Root to the homepage
  root 'pages#home'

  # School resources
  resources :schools, only: [:show] do
    # Courses nested within schools
    resources :courses, only: [:index]
    # Course presets nested within Schools
    resources :course_presets
    # Course locations nested within schools
    resources :course_locations
  end

end
