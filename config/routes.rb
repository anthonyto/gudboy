Rails.application.routes.draw do
  post 'auth' => 'auth#authenticate'
  resource :user, only: [:index, :show, :create, :update], defaults: { format: :json }
  
  resources :categories, only: [:index, :show, :create, :update], defaults: { format: :json } do 
    resources :transactions, only: [:index, :show, :create, :update, :destroy], defaults: { format: :json }
  end
  
  root to: 'auth#authenticate'
end
