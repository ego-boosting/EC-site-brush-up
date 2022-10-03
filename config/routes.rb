Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  # URLは変えたくない
  # ファイル構成だけ指定のパスにしたい
  # scope moduleを使う必要がある
  scope module: :customer do
    root :to => "homes#top"
    get "homes/about" => "homes#about", as: "about"
    get "customers/mypage" => "customers#show"
    get "customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
    patch "customers/withdrawal" => "customers#withdrawal", as: "withdrawal"
    get "orders/confirm" => "orders#confirm", as: "confirm"
    get "orders/complete" => "orders#complete", as: "complete"

    resources :items
    resources :customers, only: [:edit,:update,:destroy]
    resources :orders, only: [:new,:index,:create,:show]
    resources :shipping_addresses, only: [:index,:create,:edit,:update,:destroy]
    resources :cart_items, only: [:index,:create,:update,:destroy] do
      collection do
        delete "destroy_all"
      end
    end
  end


  # 管理者用
  namespace :admin do
    resources :items
    resources :orders, only: [:index,:show,:update]
    resources :order_details, only:[:update]
    resources :genres, only: [:index,:create,:edit,:update,:destroy]
    resources :customers, only:[:index,:show,:edit,:update]
  end
end
