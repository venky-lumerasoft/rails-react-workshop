class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :sort_order, :assignee
  def assignee
    object.assignee&.email
  end
end
