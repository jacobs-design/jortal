CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJV3BPCJFYGQY7JQQ',
      aws_secret_access_key: 'HuPL3G9YIlWABlNuF2j+1EuVPrY9H4P3MxZ0azVEENV',
      region:                'us-west-2'
  }
  config.fog_directory  = 'studentprojects'
  config.fog_public     = true
  config.fog_use_ssl_for_aws = false
  config.storage        = :fog
end