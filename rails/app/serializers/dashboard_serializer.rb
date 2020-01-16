class DashboardSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :lists, serializer: ListSerializer
end
