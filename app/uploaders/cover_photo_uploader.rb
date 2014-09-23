# encoding: utf-8

class CoverPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :thumb do
    process resize_to_fill: [200, 160]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("default_thumb_coverphoto.jpg")
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
