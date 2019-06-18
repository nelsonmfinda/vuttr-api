class Tool
  include HTTParty
  base_uri CONFIG['base_uri']

  def initialize (body, token)
    @options = {:headers => {
      "Content-Type" => "application/json",
      "Authorization" => token
    }, :body => body
  }
  end

  def post_tool
    self.class.post("/tools",@options)
  end

  def get_tool(id)
    self.class.get("/tool/#{id}",@options)
  end

  def delete_tool(id)
    self.class.delete("/tools/#{id}",@options)
  end

  def find_by_tag(tag)
    self.class.get("/tools/tag?=#{tag}",@options)
  end

end
