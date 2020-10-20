Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'details', to: 'users/registrations#new_detail'
    post 'details', to: 'users/registrations#create_detail'
    get 'details',  to: 'users/registrations#edit_detail'
    patch 'details', to: 'users/registrations#update_detail'
  end
  get 'home/index'
  get 'users/search'
  root to: "home#index"
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      put :follow, :unfollow
    end
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
end
