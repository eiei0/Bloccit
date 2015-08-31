Rails.application.routes.draw do

  get 'comments/create'

  devise_for :users
  resources :users, only: [:update, :show]

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :posts, only: [] do
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
     resources :comments, only: [:create, :destroy]
     resources :favorites, only: [:create, :destroy]
  end


  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end