class ToolSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :description, :tags, :created_by
end
