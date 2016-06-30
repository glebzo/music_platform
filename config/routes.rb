Rails.application.routes.draw do
  devise_for :listeners
  root 'application#home'

  namespace :admin do
    get '/' => 'channels#index'
    resources :channels, only: [:index, :show, :edit, :update] do
      resources :soundtracks, only: [:index, :new, :create]
    end
  end

  scope 'api/' do
    scope 'v1/' do
      resources :channels, only: [:index, :show] do
        resources :soundtracks, only: [:index]
      end
    end
  end

end

