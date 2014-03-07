Redfxstock::Application.routes.draw do

  devise_for :users, :controllers => {:sessions => 'guest/categories'} do
    post "/sessions/user" => 'sessions#create'
  end


  post '/rate' => 'rater#create', :as => 'rate'

  resources :tags
  get 'tags/:tag', to: 'uploads#index', as: :tag

  namespace :admin do
    resources :galleries
    resources :uploads do
      resources :comments
    end
    resources :expertises
    resources :profiles
    resources :roles
    resources :categories
    resources :home, only: :show
    resources :users do
      resources :comments
    end
    resources :states
    resources :countries
  end

  namespace :member do
    resources :galleries
    resources :uploads do
      resources :comments
    end
    resources :expertises
    resources :profiles
    resources :roles
    resources :categories
    resources :home, only: :show
    resources :users do
      resources :comments
    end
  end

  namespace :guest do
    resources :galleries
    resources :uploads do
      resources :comments
    end
    resources :expertises
    resources :profiles
    resources :categories
    resources :home, only: :show
    resources :users do
      resources :comments
    end
  end

  root :to => "home#index"

end
