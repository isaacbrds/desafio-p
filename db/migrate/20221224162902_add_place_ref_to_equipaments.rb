class AddPlaceRefToEquipaments < ActiveRecord::Migration[7.0]
  def change
    add_reference :equipaments, :place, null: false, foreign_key: true
  end
end
