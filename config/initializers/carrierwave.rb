require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }
  case Rails.env
  when 'production'
    config.fog_directory  = 's3-sharemusic'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/s3-sharemusic'
  when 'development'
    config.fog_directory  = 's3-sharemusic-development'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/s3-sharemusic-development'
  end
end
