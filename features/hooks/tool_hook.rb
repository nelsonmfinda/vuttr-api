Before '@tool' do

    body = {
    "title" => Faker::Lorem.word,
    "link" => Faker::Internet.url,
    "description" => Faker::Lorem.paragraph_by_chars(100, false),
    "tags": [
      "organization",
      "planning",
      "collaboration",
      "writing",
      "calendar",
      "https",
      "organizing",
      "webapps",
      "domain",
      "developer",
      "node",
      "proxy"
    ].sample(5)
  }

  @body = JSON.generate(body)

end
