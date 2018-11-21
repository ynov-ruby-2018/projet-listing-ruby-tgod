class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :titre
      t.text :description
      t.integer :prix

      t.timestamps
    end
  end
end
