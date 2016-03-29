Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users do
    member do
    get :follow
    get :unfollow
    get :following, :followers
    
end
end


get 'auth/:provider/callback', to: 'sessions#create'
get 'auth/failure', to: redirect('/')
get 'signout', to: 'sessiona#destroy', as: 'signout'

  resources :categories 
   
  

 resources :posts do
 	member do
 		get "like", to:"posts#upvote"
 		get "dislike", to:"posts#downvote"
    post "agree"
    patch :approve, to:"posts#approve"
 	end
  
 	resources :comments do
      member do
        get "like", to:"comments#upvote"
        get "dislike", to:"comments#downvote"
  end
  end
 end


 
  root 'posts#index'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'posts/examine'
  resources :follows
  
end
