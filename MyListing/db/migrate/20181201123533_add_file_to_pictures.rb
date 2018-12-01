class AddFileToPictures < ActiveRecord::Migration[5.2]
  def change
    add_attachment :pictures, :file
  end
end
