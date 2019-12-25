require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|

  if Rails.env.production? || Rails.env.development? # 開発中もs3使う
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'wine-management-app'
    config.asset_host = 'https://s3-ap-northeast1.amazonaws.com/wine-management-app'
    config.asset_host = 'https://wine-management-app.s3.amazonaws.com'
    config.fog_public = false
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET'],
      region: 'ap-northeast-1',
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end