class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  validates :email, :password, :username, presence: true

  mount_uploader :picture, UserPictureUploader

  has_many :tutorials

end
