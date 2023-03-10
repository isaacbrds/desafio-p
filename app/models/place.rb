class Place < ApplicationRecord
  has_many :equipaments
  belongs_to :parent, class_name: "Place", optional: true
  validates_presence_of :name
  paginates_per 5

  scope :for_name, ->(name) { where(["name LIKE ?", "%#{name}%"]) }
end
