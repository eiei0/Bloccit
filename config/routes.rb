Rails.application.routes.draw do

  resources :posts, except: [:show]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
