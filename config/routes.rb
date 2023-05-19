Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/dogs" => "dogs#index"
  post "/dogs" => "dogs#create"
  # patch "/dogs/:id" => "dogs#update"
  # delete "/dogs/:id" => "dogs#destroy"
  post "/users" => "users#create"
end
