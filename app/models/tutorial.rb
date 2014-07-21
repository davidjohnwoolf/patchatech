class Tutorial < ActiveRecord::Base
  include Elasticsearch::Model

  mapping do
    indexes :title, type: 'string', analyzer: 'simple' #, fuzziness: 2, completion: 'suggest'
    indexes :description
  end

  after_commit on: [:create] do
    index_document
  end

  after_commit on: [:update] do
    update_document
  end

  after_commit on: [:destroy] do
    delete_document
  end
  
  def self.search(params, options={})

     es = __elasticsearch__
       definition = {
         query: {
           query_string:{
             query: params

          }
        }
      }

      response = es.search(definition)
      response
  end



  belongs_to :user
  validates :user_id, :title, :description, :category, :video, presence: true
  mount_uploader :video_tile, VideoTileUploader
  mount_uploader :video, TutorialVideoUploader
end
