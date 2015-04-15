CarrierWave.configure do |config|
    if Rails.env.test?
        config.storage = :file
        config.enable_processing = false
    else 
        config.storage = :fog
        config.fog_credentials = {
          provider:                'AWS',
          aws_access_key_id:       ENV['AWS_ACCESS_KEY'], 
          aws_secret_access_key:   ENV['AWS_SECRET_KEY'],
          endpoint:                'https://s3.amazonaws.com',
          region:                  'us-east-1'
        }
        config.fog_directory = ENV['AWS_BUCKET'] 
    end
end
