Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  resources :books, only: [:index, :show, :create, :edit, :destroy, :update]
  resources :users, only: [:index, :show, :create, :edit, :update ]

   get '' => 'homes#top',as:'top'
   get 'home/about' => 'homes#about',as:'about'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
