Rails.application.routes.draw do

  root 'pages#home'

  get 'about' => 'pages#about'

  get 'help' => 'pages#help'

  get 'contact' =>  'pages#contact'

  get 'signup' => 'users#new'

  resources :users
end
