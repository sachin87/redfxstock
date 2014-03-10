Redfxstock::Application.routes.draw do

  devise_for :users, :controllers => {:sessions => 'guest/categories'} do
    post "/sessions/user" => 'guest/categories#create'
    get "/guest/categories" => 'guest/categories#index'
    get "/guest/categories/:id" => 'guest/categories#show'
  end


  post '/rate' => 'rater#create', :as => 'rate'

  resources :tags
  get 'tags/:tag', to: 'uploads#index', as: :tag

  namespace :admin do
    resources :galleries, :expertises, :profiles, :categories
    resources :uploads do
      resources :comments
    end
    resources :roles
    resources :home, only: :show
    resources :users do
      resources :comments
    end
    resources :states, :countries
  end

  namespace :member do
    resources :galleries, :expertises, :profiles, :categories
    resources :uploads do
      resources :comments
    end
    resources :home, only: :show
    resources :users do
      resources :comments
    end
  end

  namespace :guest do
    resources :galleries, :expertises, :profiles
    resources :categories, only: :show
    resources :uploads do
      resources :comments
    end
    resources :home, only: :show
    resources :users do
      resources :comments
    end
  end

  root :to => "home#index"

end
