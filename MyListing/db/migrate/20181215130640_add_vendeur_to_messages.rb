class AddVendeurToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :vendeur, :integer
  end
end
