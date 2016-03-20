Rails.application.routes.draw do
  post 'auth' => 'auth#authenticate'
  resources :users, only: [:index, :show, :create, :update], defaults: { format: :json }
  
  root to: 'auth#authenticate'
end
