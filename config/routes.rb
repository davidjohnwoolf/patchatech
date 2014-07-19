Rails.application.routes.draw do

  resources :user, only: :show

  resources :tutorials

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'site#index'
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  post '/contact' => 'site#contact'

end
