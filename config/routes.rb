Rails.application.routes.draw do

  resources :user, only: :show

  resources :tutorials do
    patch '/rate_up' => 'tutorials#rate_up'
    patch '/rate_down' => 'tutorials#rate_down'
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'site#index'
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  post '/contact' => 'site#contact'
  get '/search' => 'search_results#index'

end
