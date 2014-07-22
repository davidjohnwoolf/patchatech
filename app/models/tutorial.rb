class Tutorial < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mapping do
    indexes :title, type: 'string', analyzer: 'simple' #, fuzziness: 2, completion: 'suggest'
    indexes :description
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
  mount_uploader :cover_photo, CoverPhotoUploader
  mount_uploader :video, TutorialVideoUploader
end
