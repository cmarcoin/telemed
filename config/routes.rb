# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :doctors, controllers: { sessions: 'doctors/sessions' }
  devise_for :pharmacists, controllers: { sessions: 'pharmacists/sessions',
                                          registrations: 'pharmacists/registrations' }
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions' }




  namespace :pharmacists do
    get 'accueil', to: 'pages#index'

  end



  root to: 'pages#index'
end
