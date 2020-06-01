Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/browse' => "browse#browse", as: :browse
  post '/approve/:id' => "browse#approve", as: :approve_user
  post '/decline/:id' => "browse#decline", as: :decline_user

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
