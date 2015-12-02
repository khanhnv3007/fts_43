Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  devise_for :users, path_prefix: "d",
    controllers: {omniauth_callbacks: Settings.auth_callback}
  resources :subjects

  resources :users do
    resources :questions
  end
  resources :exams
  namespace :admin do
    root "static_pages#admin_home"
    resources :subjects
    resources :users
    resources :exams
    resources :questions
  end
end
