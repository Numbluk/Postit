PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: [:destroy] do
    resources :comments, only: [:create] do
      member do
        post :votes, only: :create
      end
    end

    member do
      post :votes, only: :create
    end
  end

  resources :categories, only: [:show, :new, :create]

  resources :users, only: [:create, :show, :edit, :update]
  get 'register', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
