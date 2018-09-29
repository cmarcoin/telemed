# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :doctors, path: 'doctors'
  devise_for :pharmacists, path: 'pharmacists'
  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users'
  root to: 'pages#index'
end
