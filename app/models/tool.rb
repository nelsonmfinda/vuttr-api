class Tool < ApplicationRecord
  # validations
  validates_presence_of :title, :link, :description, :tags, :created_by
end
