class Tutorial < ActiveRecord::Base

  belongs_to :user
  validates :user_id, :title, :description, :category, :video, :video_tile, presence: true
  mount_uploader :video_tile, VideoTileUploader
  mount_uploader :video, TutorialVideoUploader
end
