Api::Engine.routes.draw do
  resources :engine_tests, only: [:index]
  match '/engines/api/*path' => 'engine_tests#index'
end
