# encoding: utf-8

class UserPictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :normal do
    process resize_to_fill: [200, 200]
  end

  version :thumb, from_version: :normal do
    process resize_to_fill: [50, 50]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("default_#{version_name}.jpg")
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

end
