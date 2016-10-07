Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'


  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/posts/:id', to: 'posts#show', as: 'post'

  get '/cities/:id', to: 'cities#show', as: 'city'

end
