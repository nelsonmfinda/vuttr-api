Before "@signup" do
  password = Faker::Internet.password(8)

  body = {
    "name": Faker::Name.name,
    "email": Faker::Internet.email,
    "password": password,
    "password_confirmation": password
  }

  @body = JSON.generate(body)

  @signup = Signup.new(@body)
end
