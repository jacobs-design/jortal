CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAIC5W4VR5J2ZHQADA',
      aws_secret_access_key: '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',
      endpoint:              'https://s3.amazonaws.com',
  }
  config.fog_directory  = 'jortal.herokuapp.com'
  config.fog_public     = true
  config.fog_use_ssl_for_aws = false
  config.storage        = :fog
end

