class Place < ApplicationRecord
  belongs_to :parent, class_name: "Place", optional: true
  validates_presence_of :name
end
