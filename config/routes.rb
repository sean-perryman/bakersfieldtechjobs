Rails.application.routes.draw do
  # Devise for user authentication
  devise_for :users
  
  #devise routes
  devise_scope :user do
    get '/sign_up' => 'devise/registrations#new'
    get '/sign_in' => 'devise/sessions#new'
  end

  #Company Listing (Add/Remove/Show)
  resources :companies#, only: [:index]
  
  # Roadmap Page
  get 'roadmap', to: 'roadmap#index'
  
  # Landing Page
  get 'landing_page/index'
  
  # Contact Form
  resources "contacts", only: [:new, :create]

  resources :jobs

  root 'landing_page#index'
end
