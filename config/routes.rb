Blog::Application.routes.draw do

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "profile" => "users#profile", :as => "profile"
  get "others_profile" => "users#others_profile", :as => "others_profile"
  get "feed" => "posts#feed", :as => "feed"
  get "userposts" => "posts#userposts", :as => "userposts"

#### FOR FELLOWSHIP ###########################################
  get "newfellows" => "users#newfellows", :as => "newfellows"
  get "showfellows" => "users#showfellows", :as => "showfellows"
################################################################

  match "/profile/:id" => "users#profile"
#### FOR FACEBOOK ######################################
  match 'auth/:provider/callback', to: 'sessions#createfb'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
########################################################

  root :to => 'posts#index'

  resources :fellowships
  resources :fellowship
  resources :users
  resources :user
  resources :posts
  resources :sessions
  resources :comments

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
