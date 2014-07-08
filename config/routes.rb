Rails.application.routes.draw do

  resources :tutorials

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'site#index'

end
