Rails.application.routes.draw do
  # posts
  get 'posts/index' => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/create" => "posts#create"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  # users
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "signup" => "users#new"
  get "login" => "users#login_form"
  get "users/:id/edit" => "users#edit"
  get "users/:id/likes" => "users#likes"
  post "users/:id/update" => "users#update"
  post "users/create" => "users#create"
  post "login" => "users#login"
  post "logout" => "users#logout"
  # likes
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  # home
  get "/" => "home#top"
  get "/about" => "home#about"
end
