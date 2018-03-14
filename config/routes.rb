Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :warehouses, only: [:show, :index, :new, :create] do
    collection do
      get 'manage-your-space', to: "warehouses#manage_your_space"
    end
    resources :bookings, only: [:show, :index, :create]


  end

  resources :bookings, only: [] do
    collection do
      get 'my_bookings'
    end
  end

end
