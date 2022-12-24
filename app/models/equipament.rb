class Equipament < ApplicationRecord
  enum kind: [ :ar_condicionado, :cafeteira,
               :computador, :monitor, :mouse, :teclado, :televisao, :roteador ]

  validates :name, :kind, :brand, presence: true

  has_one_attached :picture

  belongs_to :place
  paginates_per 5

  scope :for_name, ->(name) { where(["name LIKE ?", "%#{name}%"]) }
end
