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

  get '/posts/:post_id', to: 'posts#show', as: 'post'
  get '/cities/:city_id/posts/new', to: 'posts#new', as: 'new_post'
  post '/cities/:city_id/posts', to: 'posts#create'


  get '/posts/:post_id/edit', to: 'posts#edit', as: 'edit_post'
  patch '/posts/:post_id', to: 'posts#update'
  delete '/posts/:post_id', to: 'posts#destroy'

  get '/cities/:city_id', to: 'cities#show', as: 'city'

end
