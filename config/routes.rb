Rails.application.routes.draw do
  get "/", to: "images#index"
end
