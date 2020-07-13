source 'https://rubygems.org'
ruby '2.2.9'

gem 'airbrake'

gem 'pg', '~> 0.19.0'

gem 'puma', '~> 3.6.0'

group :rails do
  gem 'rails', '3.2.22.5'
end

def engine(name)
  group name do
    gem name, path: "engines/#{name}"
    yield if block_given?
  end
end

engine 'api'
engine 'backoffice'
