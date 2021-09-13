Rails.application.routes.draw do

  devise_for :admins,skip:[:sessions],:controllers =>{
    :passwords => "admins/passwords"
  }

  devise_scope :admin do
    get "admins/sign_in", to: "admins/sessions#new"
    post "admins/sign_in", to: "admins/sessions#create"
    delete "admins/sign_out",to: "admins/sessions#destroy"
  end

  namespace :admins do
    resources :users,only:[:index,:show,:update,:edit]
    resources :mysteries,only:[:index,:show,:destroy]
    resources :genres,only:[:index,:create,:destroy]
  end

  devise_for :users,skip:[:sessions],:controllers => {
    :registrations => "users/registrations",
    :passwords => "users/passwords"
  }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    post "sign_in", to: "users/sessions#create"
    delete "sign_out", to: "users/sessions#destroy"
    get "sign_up", to: "users/registrations#new"
    post "sign_up", to: "users/registrations#create"
  end

  root to: "homes#top"
  get "about", to: "homes#about"

  get "users/:id/unsubscribe", to: "users#unsubscribe",as:"unsubscribe"
  patch "users/:id/withdraw", to: "users#withdraw",as:"withdraw"
  resources :users,only:[:show,:edit,:update]

  get "mysteries/:id/answer",to: "mysteries#answer",as: "answer"
  resources :mysteries do
    # コメント機能
    resources :comments,only:[:create,:update,:edit,:destroy]
    # レビュー機能
    resources :reviews,only:[:create]
    get "reviews/complete",to:"reviews#complete"
  end

  # フォロー機能
  resources :relationships,only:[:create,:destroy]
  get "followings",to: "relationships#followings",as: "followings"
  get "followers",to: "relationships#followers",as: "followers"

  get "search", to: "searches#search"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
