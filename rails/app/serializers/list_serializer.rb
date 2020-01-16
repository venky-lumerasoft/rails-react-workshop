class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :sort_order
  has_many :cards, serializer: CardSerializer
end
