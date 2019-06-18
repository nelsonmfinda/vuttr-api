Before '@login' do

  body = {
    "email": CONFIG["email"],
    "password": CONFIG["password"]
  }

  @body = JSON.generate(body)

  @login = Login.new(@body)

end
