OpenCodeTest::Application.routes.draw do
  root :to => 'home#index'
  resource :home
end
