require 'redis'
require 'redis/namespace'

host = ENV.fetch('REDIS_PORT_6379_TCP_ADDR')
port = ENV['REDIS_PORT_6379_TCP_PORT'] || 6379

Redis.current = Redis::Namespace.new("mv:#{Rails.env}", redis: Redis.new(host: host, port: port))
