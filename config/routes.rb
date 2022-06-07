Rails.application.routes.draw do
  root 'attendances#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  patch 'attendances/finish' => 'attendances#finish', as: 'finish'
  
  resources :attendances
  resources :users
  resources :holidays
  resources :logs do
    collection { post :import }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
