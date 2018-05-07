Rails.application.routes.draw do
  get 'feeds/index'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'stories#index'
  resources :stories do
    resources :comments
  end
  resources :comments do
    resources :comments
  end
end
