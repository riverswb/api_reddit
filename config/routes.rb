Rails.application.routes.draw do
  root 'home#index'
  get '/auth/reddit/callback', to: 'sessions#create'
  # get '/api/v1/authorize', to: 'sessions#create'
  get '/auth/reddit', as: 'reddit_login'
  get 'account', to: 'accounts#show'
  delete 'logout', to: 'sessions#destroy'
end
