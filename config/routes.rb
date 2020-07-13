Main::Application.routes.draw do
  def engine(engine, _subdomain = nil)
    mount engine, at: '/'
  end

  defined?(Api::Engine) && engine(Api::Engine, 'api')
  defined?(Backoffice::Engine) && engine(Backoffice::Engine, 'admin')

  match '/app/*path' => 'app_tests#index'
end
