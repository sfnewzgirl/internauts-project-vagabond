Rails.application.routes.draw do

  root "welcome#index"

  resources :users do
    resources :posts
  end

  resources :cities do
    resources :posts
  end

end
