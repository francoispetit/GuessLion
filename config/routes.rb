Rails.application.routes.draw do

  root 'pages#home'


      devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
      resources :users, only: [:index]

  get "/quiz", to: 'users#quiz', as: 'quiz'
  post "/quiz", to: 'users#check', as: 'check'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
