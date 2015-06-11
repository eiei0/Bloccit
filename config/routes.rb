Rails.application.routes.draw do

  resources :posts, :advertisement, :questions

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
