Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :warehouses, only: [:show, :index, :new, :create] do
    collection do
      get 'manage-your-space', to: "warehouses#manage_your_space"
    end
    resources :bookings, only: [:show, :index]
  end
end
