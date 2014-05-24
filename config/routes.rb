Redfxstock::Application.routes.draw do

  devise_for :users, :controllers => {sessions: 'sessions',
                                      omniauth_callbacks: 'omniauth_callbacks' }

  devise_scope :user do
   get '/guest/categories' => 'guest/categories#index'
    get '/login' => 'devise/sessions#new'
    get '/search' => 'guest/categories#search'
    get '/sign_up' => 'devise/registrations#new'
    get '/categories/:id' => 'guest/categories#show'
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
    resources :categories
    resources :uploads do
      resources :comments
    end
    resources :home, only: :show
    resources :users do
      resources :comments
    end
  end

  root :to => 'guest/categories#index'

end
