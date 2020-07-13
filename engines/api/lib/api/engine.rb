module Api
  class Engine < ::Rails::Engine
    isolate_namespace Api
    engine_name 'api'
  end
end
