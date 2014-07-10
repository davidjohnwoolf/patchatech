Rails.application.routes.draw do

  resources :user, only: :show

  resources :tutorials

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'site#index'
    get '/search', to: 'tutorials#search', as: :search
end
