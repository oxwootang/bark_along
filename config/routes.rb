Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/index'
  resources :barks
  root 'barks#index'
end
