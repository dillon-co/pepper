# $redis = Redis.new(url: ENV["REDIS_URL"])

if ENV["REDIS_URL"]
    uri = URI.parse(ENV["REDIS_URL"])
    REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
    Resque.redis = REDIS
end
