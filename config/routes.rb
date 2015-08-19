Rails.application.routes.draw do
  devise_for :users
    resources :posts do
        resources :comments 
        resources :pictures
   end
    root 'posts#index'

    get '/about', to: 'posts#about'
end
