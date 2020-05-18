Rails.application.routes.draw do
  devise_for :users
  resources :myquestions, only: [:index, :new, :create, :destroy] 
  root to: 'questions#top'
  resources :questions, only: [:index, :new, :create] do
    collection do
      get 'top'
      get 'quiz'
      get 'about'
    end
  end
  resources :users, only: :show 
  resources :pins, only: [:create, :destroy]
end
