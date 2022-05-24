Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'attendances#index'
  resources :attendances
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
