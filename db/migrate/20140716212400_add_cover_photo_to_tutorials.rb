class AddCoverPhotoToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :cover_photo, :string
  end
end
