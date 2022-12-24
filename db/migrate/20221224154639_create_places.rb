class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.references :parent, foreign_key: {to_table: :places}

      t.timestamps
    end
  end
end
