class AddVideoDurationColumnToTutorial < ActiveRecord::Migration
  def change
    add_column :tutorials, :video_duration, :string
  end
end
