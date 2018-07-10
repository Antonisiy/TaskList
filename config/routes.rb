Rails.application.routes.draw do
  root 'index#index'
  resources :todos
  resources :projects
  post '/projects/:id/todos', to: 'todos#create'
  post '/projects/:id/todos/:idTodo', to: 'todos#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
