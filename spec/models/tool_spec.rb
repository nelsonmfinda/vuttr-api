require 'rails_helper'

RSpec.describe Tool, type: :model do
  it "ensure column title are present" do
    should validate_presence_of(:title)
  end

  it "ensure column link are present" do
    should validate_presence_of(:link)
  end

  it "ensure column description are present" do
    should validate_presence_of(:description)
  end

  it "ensure column tags are present" do
    should validate_presence_of(:tags)
  end
end
