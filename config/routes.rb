Rails.application.routes.draw do
  devise_for :listeners
  root 'application#home'

  namespace :admin do
    get '/' => 'channels#index'
    resources :channels, only: [:index, :show, :edit] do
      resources :soundtracks, only: [:index, :new, :create]
    end
  end

  scope 'api/' do
    resources :channels, only: [:index, :show]
    resources :soundtracks, only: [:index]
  end

end
