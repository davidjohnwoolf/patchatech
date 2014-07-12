class Tutorial < ActiveRecord::Base

  belongs_to :user
  validates :user_id, :title, :description, :category, :video, presence: true

  mount_uploader :video, TutorialVideoUploader
end
