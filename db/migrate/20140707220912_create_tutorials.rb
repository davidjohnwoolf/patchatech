class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.belongs_to :user
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description, null:false
      t.string :category, null:false
      t.timestamps
    end
  end
end
