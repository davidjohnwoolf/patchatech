class Tutorial < ActiveRecord::Base

  belongs_to :user
  validates :user_id, :title, :description, :category, presence: true

end
