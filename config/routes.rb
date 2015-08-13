Rails.application.routes.draw do
  devise_for :users
    resources :posts do
        resources :comments 
        member do
            patch :thumbnail
        end
    end
    root 'posts#index'

    get '/about', to: 'pages#about'
end
