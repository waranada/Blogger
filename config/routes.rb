Rails.application.routes.draw do
  get 'users/new'

  root 'pages#home'

  get 'home' => 'pages#home'

  get 'about' => 'pages#about'

  get 'help' => 'pages#help'

  get 'contact' =>  'pages#contact'

  get 'signup' => 'users#new'

end
