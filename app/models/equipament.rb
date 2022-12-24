class Equipament < ApplicationRecord
  enum kind: [ :ar_condicionado, :cafeteira,
               :computador, :monitor, :mouse, :teclado, :televisao, :roteador ]
  validates_presence_of :name, :kind, :brand

  has_one_attached :picture
end
