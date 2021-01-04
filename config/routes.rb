Rails.application.routes.draw do
  get 'contacts/new'
  
  get "mypage", to: "users#me"

  # session管理系
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # リソースベースルーティングで一括設定
  root "home#index"
  resources :users, only: %i[new create]
  resources :boards
  resources :comments, only: %i[create destroy]
  resources :users, only: %i[new create]
end
