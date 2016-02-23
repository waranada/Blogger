Rails.application.routes.draw do
  root 'pages#home'
  get '/home' => 'pages#home'

  get '/about' => 'pages#about'

  get '/help' => 'pages#help'

  get '/contact' =>  'pages#contact'

end
