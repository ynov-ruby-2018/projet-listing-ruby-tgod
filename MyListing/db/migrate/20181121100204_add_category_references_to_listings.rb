class AddCategoryReferencesToListings < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :category, foreign_key: true
  end
end
