EduWords::Application.routes.draw do
  get "authors/index"
  root :to => "mainpage#index"
  get "mainpage/index"
  resources :tests

  resources :languages
end