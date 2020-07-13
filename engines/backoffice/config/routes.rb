Rails.application.routes.draw do
  mounted_path = Rails.application.routes.named_routes[:backoffice].path.spec.to_s

  scope mounted_path do
    ActiveAdmin.routes(self)
  end
end

Backoffice::Engine.routes.draw do
  mounted_path = Rails.application.routes.named_routes[:backoffice].path.spec.to_s
  match '/' => redirect("#{mounted_path == '/' ? '' : mounted_path}/admin"), :via => %i[get post]

  match '/engines/bo/*path' => 'engine_tests#index'
end
