Rails.application.routes.draw do
  resources :summaries
  root to: "uploads#new"
  get 'index' => "uploads#new"
  get '/about' => "uploads#about"
  resources :uploads
end
