class Dashboard < ApplicationRecord
  belongs_to :user

  has_many :lists, ->{ order(sort_order: :asc) }
end
