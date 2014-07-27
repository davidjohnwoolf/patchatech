class AddRatingAndUserRatingToTutorialsModel < ActiveRecord::Migration
  def change
    add_column :tutorials, :rating, :integer, default: 0
    add_column :tutorials, :user_rated, :string, array: true, default: '{}'
  end
end
