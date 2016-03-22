Rails.application.routes.draw do
  post 'auth' => 'auth#authenticate'
  resources :users, only: [:index, :show, :create, :update], defaults: { format: :json }
  resources :categories, only: [:index, :show, :create, :update]
  
  root to: 'auth#authenticate'
end
