env = ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'

redis_url = YAML.load(ERB.new(File.read('app/config/redis.yml')).result(binding)[env])

Sidekiq.configure_server do |config|
  config.redis = { url: "#{redis_url}/sidekiq" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "#{redis_url}/sidekiq" }
end
