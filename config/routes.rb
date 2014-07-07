Rails.application.routes.draw do

  resources :tutorials
  devise_for :users
  root 'site#index'

end
