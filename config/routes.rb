Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :ingredients

  resources :meals do
    resources :ingredients, :controller => 'recipes', only: [:index, :destroy]
  end

  post 'meals/:meal_id/ingredients/:id/add' => 'recipes#add', as: 'meal_ingredients_add'

  resources :menus do
    resources :meals
  end


# Custom routes for user interaction and sessions
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/profile' => 'users#show'
  get '/users' => 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
end
