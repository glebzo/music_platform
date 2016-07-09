Rails.application.routes.draw do
  api_version(:module => "V1", :parameter => {:name => "version", :value => "1"}) do
  end
  devise_for :listeners
  root 'application#home'

  namespace :admin do
    get '/' => 'channels#index'
    resources :channels, only: [:index, :show, :edit, :update] do
      resources :soundtracks, only: [:index, :new, :create]
    end
  end

  api_version(module: "V1", :header => { :name => "API-VERSION", :value => "v1" }, :defaults => {:format => :json}, default: true) do
    resources :channels, only: [:index, :show], defaults: { format: :json } do
      resources :soundtracks, only: [:index]
    end
  end
end

