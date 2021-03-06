# Be sure to restart your server when you modify this file.
require Rails.root.join('config', 'initializers', 'redis')

server_config = {
  host: Redis.current.client.host,
  port: Redis.current.client.port,
  db: 2,
  namespace: 'mv:session:'
}
Rails.application.config.session_store :redis_store, servers: server_config, expire_after: 2.days
