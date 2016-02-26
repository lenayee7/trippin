Rails.application.routes.draw do
  root to: "users#index"
  resources :users
  resources :trips do 
  	resources :posts
  end



  # get "/trips/:trip_id/posts/new", to: "posts#new"


  get "/sign_in", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
end
#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         users#index
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
#     posts GET    /posts(.:format)          posts#index
#           POST   /posts(.:format)          posts#create
#  new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#      post GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy
#     trips GET    /trips(.:format)          trips#index
#           POST   /trips(.:format)          trips#create
#  new_trip GET    /trips/new(.:format)      trips#new
# edit_trip GET    /trips/:id/edit(.:format) trips#edit
#      trip GET    /trips/:id(.:format)      trips#show
#           PATCH  /trips/:id(.:format)      trips#update
#           PUT    /trips/:id(.:format)      trips#update
#           DELETE /trips/:id(.:format)      trips#destroy
#   sign_in GET    /sign_in(.:format)        sessions#new
#  sessions POST   /sessions(.:format)       sessions#create
#           DELETE /sessions(.:format)       sessions#destroy