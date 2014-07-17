class Tutorial < ActiveRecord::Base
  include Elasticsearch::Model

  mapping do
    indexes :title, type: 'string'
    indexes :description
  end



  belongs_to :user
  validates :user_id, :title, :description, :category, :video, presence: true
  mount_uploader :video_tile, VideoTileUploader
  mount_uploader :video, TutorialVideoUploader
end
