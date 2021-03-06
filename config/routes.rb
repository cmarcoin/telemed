# frozen_string_literal: true

Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'
  # Using devise with multiple models : https://github.com/plataformatec/devise/wiki/How-to-Setup-Multiple-Devise-User-Models
  devise_for :doctors, controllers: { sessions: 'doctors/sessions',
                                      registrations: 'doctors/registrations' }
  devise_for :pharmacists, controllers: { sessions: 'pharmacists/sessions',
                                          registrations: 'pharmacists/registrations' }
  devise_for :admins, controllers: { sessions: 'admins/sessions',
                                      registrations: 'admins/registrations' }
  devise_for :users, controllers: { sessions: 'users/sessions' }

  namespace :pharmacists do
    get 'accueil', to: 'pages#index'
    get 'patient/nouveau', to: 'users#new'
    post 'patients', to: 'users#create'
    get 'patients/:id/editer', to: 'users#edit'
    post 'patients/:id/mettre_a_jour', to: 'users#update'
    get 'ordonnance/nouvelle', to: 'prescriptions#new'
    post 'ordonnances', to: 'prescriptions#create'
    get 'ordonnances/:id/editer', to: 'prescriptions#edit'
    post 'ordonnances/:id/mettre_a_jour', to: 'prescriptions#update'
  end

  namespace :admins do
    get 'accueil', to: 'pages#index'
  end

  root to: 'pages#index'
end