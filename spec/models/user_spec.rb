require "rails_helper"

RSpec.describe User, type: :model do
  it "User model has a 1:m relatioship with the Tools model" do
    should have_many(:tools)
  end

  it "ensure column name are present and is valid" do
    should validate_presence_of(:name)
    should validate_length_of(:name)
  end

  it "ensure column email are present and is valid" do
    should validate_presence_of(:email)
    should validate_length_of(:name)
  end

  it "ensure column email has uniqueness" do
    should validate_uniqueness_of(:email)
  end

  it "ensure column password_digest are present" do
    should validate_presence_of(:password_digest)
  end
end
