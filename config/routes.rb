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
    get "homes/about" => "homes#about"
  end

end
