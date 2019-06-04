class Rack::Attack

  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # Allow all local traffic

  safelist('allow-localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  # Allow an IP address to make 5 requests every 60 seconds

  throttle('req/ip', limit: 5, period: 60) do |req|
    req.ip
  end

  # Throttle login attempts for a given email parameter to 3 reqs/minute
  # Return the email as a discriminator on POST /login requests

  # throttle("/api/v1/auth/login", limit: 5, period: 20.seconds) do |req|

  #  if req.path == '/api/v1/auth/login' && req.post?

  #    req.params['email']

  #  end

  # end

  # Send the following response to throttled clients
  self.throttled_response = ->(env) {
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
      429,
      {'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s},
      [{error: "Throttle limit reached. Retry later."}.to_json]
    ]
  }

end
