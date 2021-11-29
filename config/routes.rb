Rails.application.routes.draw do
  get "todos", to: "todos#index"
  post "todos", to: "todos#create"
  get "todos/:id", to: "todos#show"
  patch "todos/:id", to: "todos#update"

  get "users", to: "users#index"
  post "users", to: "users#create"
  get "users/:id", to: "users#show"
  post "users/login", to: "users#login"

end
