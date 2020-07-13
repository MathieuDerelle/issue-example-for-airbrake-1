workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000 # if ENV['DISABLE_PUMA_PORT'] != '1'
environment ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'

before_fork do
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  defined?($redis) &&
    $redis.quit

  defined?(Resque) &&
    Resque.redis.quit
end

on_worker_boot do
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection

  defined?($redis) &&
    $redis.client.reconnect

  defined?(Resque) &&
    Resque.redis.client.reconnect
end
