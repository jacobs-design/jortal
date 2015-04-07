CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY"],
      aws_secret_access_key: ENV["AWS_SECRET_KEY"],
      endpoint:              'https://s3.amazonaws.com',
  }
  config.fog_directory  = ENV["AWS_BUCKET"]
  config.fog_public     = true
  config.fog_use_ssl_for_aws = false
  config.storage        = :fog
end

