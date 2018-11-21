class AddCategoryReferencesToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_reference :announcements, :category, foreign_key: true
  end
end
