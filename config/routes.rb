Rails.application.routes.draw do
  # !topページ用
  get "/", to: "tops#index"

  # ! movie用のru0ティング
  get "/movie", to: "movie_posts#index"
  get "/movie/new", to: "movie_posts#new"
  post "/movie/create", to: "movie_posts#create"
  get "/movie/show/:id", to: "movie_posts#show"
  get "/movie/edit/:id", to: "movie_posts#edit"
  patch "/movie/update/:id", to: "movie_posts#update"
  delete "/movie/delete/:id", to: "movie_posts#delete"
end
