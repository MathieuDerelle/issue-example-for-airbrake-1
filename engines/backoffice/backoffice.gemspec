$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'backoffice/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'backoffice'
  s.version     = Backoffice::VERSION
  s.authors     = ['mathieu']
  s.email       = ['mathieu@example.com']
  s.homepage    = 'http://www.example.com'
  s.summary     = 'Awesome backoffice'
  s.description = 'Awesome backoffice'

  s.files = Dir['{admin,app,config,lib}/**/*']
  s.test_files = Dir['spec/**/*']

  s.add_runtime_dependency 'activeadmin', '0.6.6'
  s.add_runtime_dependency 'sass-rails', '~> 3.2.3'
end
