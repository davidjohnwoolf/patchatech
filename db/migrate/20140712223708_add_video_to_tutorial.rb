class AddVideoToTutorial < ActiveRecord::Migration
  def change
    add_column :tutorials, :video, :string
  end
end
