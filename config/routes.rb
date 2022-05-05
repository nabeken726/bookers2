Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  
  root to: "homes#top"
  devise_for :users
  
  resources :books, only: [:new, :index, :show]
  


   get 'homes/top' => 'homes#top',as:'top'
   get 'homes/about' => 'homes#about',as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
