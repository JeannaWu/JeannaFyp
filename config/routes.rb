Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, class_name: 'FormUser', :controllers => { :omniauth_callbacks => 'omniauth_callbacks' , registrations: 'registrations'}
  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end
  resources :users do
    member do
    get :follow
    get :unfollow
    get :following, :followers
    
end
end

 
 

  resources :categories 

  resources :form_users

 resources :posts do
 	member do
 		get "like", to:"posts#upvote"
 		get "dislike", to:"posts#downvote"
    post "agree"
    post "disagree"
    patch :approve, to:"posts#approve"
 	end
  
 	resources :comments do
      member do
        get "like", to:"comments#upvote"
        get "dislike", to:"comments#downvote"
        post "agree"
        post "disagree"
        patch :approve, to:"comments#approve"
  end
  end
 end


 
  root 'posts#index'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'posts/examine'
  resources :follows
  
end
