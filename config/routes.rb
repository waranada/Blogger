Rails.application.routes.draw do
  get '/about' => 'pages#about'

  get '/help' => 'pages#help'

  get 'contact' =>  'pages#contact'

end
