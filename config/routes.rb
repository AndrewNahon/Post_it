PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' =>  'users#new'

  resources :posts do

    member do 
      post 'vote'
    end

    resources :comments, only: [:create] do 
      member do
        post 'vote'
      end
    end
  end

  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:show, :create, :edit, :update]

end
