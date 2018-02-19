Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :wheelies do
    collection do                       # collection => no restaurant id in URL
      get 'search', to: "wheelies#search"
    end
    resources :bookings, only: [:new, :create]
  end
end
