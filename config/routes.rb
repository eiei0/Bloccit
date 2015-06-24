Rails.application.routes.draw do

<<<<<<< HEAD
<<<<<<< HEAD
  resources :posts, except: [:show]
=======
  resources :posts, :advertisement, :questions
>>>>>>> assignment-MoreCRUD
=======
  devise_for :users
  resources :posts
>>>>>>> checkpoint-UserAuthentication

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
