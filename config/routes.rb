Rails.application.routes.draw do
  devise_for :users

  resources "conversations" do
    resources "messages"
  end

  get '/browse' => "browse#browse"
  get '/matches' => "browse#matches"
  post '/approve/:id' => "browse#approve", as: :approve_user
  post '/decline/:id' => "browse#decline", as: :decline_user
  post '/get/conversation/:id' => "browse#open_conversation"

  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
