Rails.application.routes.draw do
  post 'auth' => 'auth#authenticate'
  resources :users, only: [:index, :show, :create, :update], defaults: { format: :json } do 
    resources :categories, only: [:index, :show, :create, :update]
  end
  
  root to: 'auth#authenticate'
end
