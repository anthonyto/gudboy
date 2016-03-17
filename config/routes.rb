Rails.application.routes.draw do
  resources :users
  post 'auth' => 'auth#authenticate'
end
