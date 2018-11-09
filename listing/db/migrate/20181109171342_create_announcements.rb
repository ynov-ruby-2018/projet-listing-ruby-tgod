class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :titre
      t.text :description
      t.integer :prix

      t.timestamps
    end
  end
end
