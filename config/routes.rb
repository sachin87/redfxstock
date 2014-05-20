Redfxstock::Application.routes.draw do

  devise_for :users, :controllers => {sessions: 'sessions',
                                      omniauth_callbacks: 'omniauth_callbacks' }

  devise_scope :user do
    post "/sessions/user" => 'guest/categories#create'
    get "/guest/categories" => 'guest/categories#index'
    get "/guest/categories/login" => 'guest/categories#login'
    get "/guest/categories/search" => 'guest/categories#search'
    get "/guest/categories/sign_up" => 'guest/categories#sign_up'
    get "/guest/categories/sign_up_type" => 'guest/categories#sign_up_type'
    get "/guest/categories/:id" => 'guest/categories#show'
    get '/' => 'guest/categories#index'
  end

  post 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  post '/rate' => 'rater#create', :as => 'rate'

  #resources :tags
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
    resources :categories do
      collection do
        get :login
        get :search
        get :sign_up_type
        get :sign_up
      end
    end
    resources :uploads do
      resources :comments
    end
    resources :home, only: :show
    resources :users do
      resources :comments
    end
  end

  root :to => "guest/categories#index"

end
