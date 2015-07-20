Rails.application.routes.draw do

  resources :posts, except: [:show]
  resources :posts, :advertisement, :questions
<<<<<<< HEAD

=======
>>>>>>> master
  devise_for :users
  resources :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
