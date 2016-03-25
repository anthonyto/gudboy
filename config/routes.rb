Rails.application.routes.draw do
  post 'auth' => 'auth#authenticate'
  resources :users, only: [:index, :show, :create, :update], defaults: { format: :json }
  resources :categories, only: [:index, :show, :create, :update] do 
    resources :transactions, only: [:index, :show, :create, :update, :destroy]
  end
  
  root to: 'auth#authenticate'
end
