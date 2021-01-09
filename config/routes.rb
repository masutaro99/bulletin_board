Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get "contacts/new", to: "contacts#new"
  # post "contacts/create", to: "contacts#create"
  resources :contacts, only: [:new, :create] do
    get 'thanks', on: :collection
  end

  get "mypage", to: "users#me"
  get "check/index", to: "check#index"

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
