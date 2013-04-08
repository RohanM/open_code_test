OpenCodeTest::Application.routes.draw do
  root :to => 'home#index'
  resource :home
  resources :tests

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
end
