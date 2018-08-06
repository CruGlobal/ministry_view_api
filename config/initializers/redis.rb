require 'redis'
require 'redis/namespace'

host = ENV.fetch('REDIS_PORT_6379_TCP_ADDR_SESSION')
port = ENV['REDIS_PORT_6379_TCP_PORT_SESSION'] || 6379

Redis.current = Redis::Namespace.new("mv:#{Rails.env}", redis: Redis.new(host: host, port: port))
