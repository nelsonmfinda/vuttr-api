class Login
  include HTTParty
  base_uri CONFIG['base_uri']

  def initialize(body)
    @options = {
      :headers => {
        "Content-Type" => "application/json"
      },
      :body => body
    }
  end

  def post_login
    self.class.post("/auth/login", @options)
  end
end
