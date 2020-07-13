worker_processes Integer(ENV['UNICORN_WORKERS'] || 1)
listen ENV['PORT'], backlog: Integer(ENV['UNICORN_BACKLOG'] || 200) if ENV['DISABLE_UNICORN_PORT'] != '1'
timeout 28
preload_app true

before_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  defined?($redis) &&
    $redis.quit

  defined?(Resque) &&
    Resque.redis.quit
end

after_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection

  defined?($redis) &&
    $redis.client.reconnect

  defined?(Resque) &&
    Resque.redis.client.reconnect
end
