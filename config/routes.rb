Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'details', to: 'users/registrations#new_detail'
    post 'details', to: 'users/registrations#create_detail'
  end
  get 'home/index'
  root to: "home#index"
  resources :users do
    member do
      put :follow, :unfollow
    end
  end
end
