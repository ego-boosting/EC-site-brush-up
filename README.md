# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


gem 'devise'

gem 'enum_help'

gem 'kaminari','~> 1.2.1'
rails g kaminari:config
rails g kaminari:views default

bundle install

rails g devise:install

【顧客用】
rails g devise Customer

【管理者用】
rails g devise Admin

カラム追加後
rails db:migrate

【顧客用】
rails g devise:controllers customer

【管理者用】
rails g devise:controllers admin

【顧客用】
rails g devise:views customers

【管理者用】
rails g devise:views admins

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'customer/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

yarn install