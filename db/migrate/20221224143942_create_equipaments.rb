class CreateEquipaments < ActiveRecord::Migration[7.0]
  def change
    create_table :equipaments do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.integer :kind, null: false
      t.text :obs

      t.timestamps
    end
  end
end
