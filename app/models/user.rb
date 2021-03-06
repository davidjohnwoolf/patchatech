class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  validates :email, :username, presence: true
  validates_uniqueness_of :username


  mount_uploader :picture, UserPictureUploader

  has_many :tutorials

  def to_param
    [id, username.parameterize].join("-")
  end

end
