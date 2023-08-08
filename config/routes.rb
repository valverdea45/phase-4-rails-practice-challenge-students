Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :instructors, only: [ :index, :show, :create, :update, :destroy ]

  resources :students, only: [ :index, :show, :create, :update, :destroy ]

  # resources :activities, only: [ :index, :destroy ]
  # resources :campers, only: [ :index, :show, :create ]
  # resources :signups, only: [ :create ]


end
