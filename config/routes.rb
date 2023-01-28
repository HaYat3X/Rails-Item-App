Rails.application.routes.draw do
  get "/", to: "images#index"
  get "/new", to: "images#new"
  post "/new", to: "images#create"

  # ! movie用のru0ティング
  get "/movie", to: "movie_posts#index"
  get "/movie/new", to: "movie_posts#new"
  post "/movie/new", to: "movie_posts#create"
end
