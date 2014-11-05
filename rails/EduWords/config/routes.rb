EduWords::Application.routes.draw do
  resources :tests

  devise_for :members
  root :to =>'home#index'
  get 'dashboard' => 'home#dashboard'
#devise_for :members,:controllers => { :registrations =>'registration'}
#match 'dashboard' => 'home#dashboard'
end