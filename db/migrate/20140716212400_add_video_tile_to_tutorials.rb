class AddVideoTileToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :video_tile, :string
  end
end
