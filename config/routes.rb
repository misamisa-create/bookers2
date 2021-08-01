Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'homes#top'
  get 'home/about'=>'homes#about'
  resources :books,only:[:index,:show,:edit,:create,:destroy,:update]
  resources :users,only:[:index,:show,:edit,:create,:update] do
    resource :relationships,only:[:create,:destroy]
    get 'followings'=>'relationship#followings',as:'followings'
    get 'followers'=>'relationship#followers',as:'followers'
  end
end
