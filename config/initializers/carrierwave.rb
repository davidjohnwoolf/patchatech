CarrierWave.configure do |config|
  if Rails.env == 'test'
    config.storage = :file
  else
    config.storage = :aws
  end
    config.aws_bucket = ENV['S3_BUCKET_NAME']
    config.aws_acl    = :public_read
    #config.asset_host = 'http://example.com'
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365
    config.aws_credentials = {
      access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }
end
