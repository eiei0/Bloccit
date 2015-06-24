Rails.application.routes.draw do

<<<<<<< HEAD
  resources :posts, except: [:show]
=======
  resources :posts, :advertisement, :questions
>>>>>>> assignment-MoreCRUD

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
