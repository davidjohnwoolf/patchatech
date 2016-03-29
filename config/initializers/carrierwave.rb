CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'us-west-1',
      host: 's3.amazonaws.com'
      # endpoint: 'https://s3-us-west-1.amazonaws.com'
    }
    config.fog_directory = ENV['S3_BUCKET_NAME']
    config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
    config.cache_dir = Rails.root.join('tmp', 'uploads')
  end
end
