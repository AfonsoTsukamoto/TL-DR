Rails.application.routes.draw do
  resources :summaries
  root to: "uploads#new"
  get 'index' => "uploads#new"
  resources :uploads
end
