Rails.application.routes.draw do
  resources :users
  resources :bugs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/loadBugs', :to => redirect('/loadBugs.html')
  root 'home#index'
end
