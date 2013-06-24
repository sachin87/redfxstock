CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id     => ENV['S3_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET']
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME']                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
