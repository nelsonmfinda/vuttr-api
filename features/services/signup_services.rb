class Signup
  include HTTParty

  base_uri CONFIG["base_uri"]

  def initialize(body)
    @options = {
      headers: {
        "Content-Type" => "application/json"
      },
      body: body
    }
  end

  def post_signup
    self.class.post("/signup", @options)
  end
end
