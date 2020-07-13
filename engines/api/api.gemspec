$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'api/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'api'
  s.version     = Api::VERSION
  s.authors     = ['mathieu']
  s.email       = ['mathieu@example.com']
  s.homepage    = 'http://www.example.com'
  s.summary     = 'Awesome api'
  s.description = 'Awesome api'

  s.files = Dir['{app,config,lib}/**/*']
  s.test_files = Dir['spec/**/*']
end
