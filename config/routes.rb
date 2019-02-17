Rails.application.routes.draw do

  # SYNTAX: verb 'path_in_url_after_localhost:3000/', to: 'controller_name#method_name', as: 'prefix_for_link_to'

  # Sets up views/pages/home.html.erb as the page rendered whenever the user just types the url without any additional path, in this case, `localhost:3000`
  root to: 'pages#home'

  # pages_controller actions
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # restaurants_controller actions
  get 'restaurants', to: 'restaurants#index'
  post 'restaurants', to: 'restaurants#create'
  # we write `:id` to make sure this is dynamic and dependant upon the instance we want to reach
  # the `as: :restaurant` makes sure that our route gets a prefix called 'restaurant' so we can access that page in our link_to by passing `restaurant_path(id)`
  get 'restaurants/:id', to: 'restaurants#show', as: :restaurant

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
