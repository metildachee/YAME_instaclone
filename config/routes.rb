Rails.application.routes.draw do
  # get 'comments/index'
  # get 'comments/create'
  # get 'comments/new'
  # get 'comments/edit'
  # get 'comments/destroy'
  # get 'posts/index'
  # get 'posts/create'
  # get 'posts/new'
  # get 'posts/edit'
  # get 'posts/show'
  # get 'posts/destory'
  # get 'posts/update'

  devise_for :users
  get 'users/index'
  get 'users/show'

  
  resources :posts do #/posts
    resources :comments #/posts/1/comments
  end

  resources :comments

  # resources :posts do #/posts
  #   resources :comments #/posts/1/comments
  # end

  # resources :users do
  #   resources :comments
  # end

  # resources :posts
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
end 
