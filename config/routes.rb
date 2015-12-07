Rails.application.routes.draw do
  devise_for :users
  root 'links#index'

  resources :links, only: [:new, :create, :show] do
    member do
      post 'upvote'
    end
  end
  mount API::Base => '/'
end
