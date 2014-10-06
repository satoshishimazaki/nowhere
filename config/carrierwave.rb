CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJAPVQ3OJU7QPA2OA',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1',
    :host                   => 'beansstreettry1.s3-website-ap-northeast-1.amazonaws.com'
    :endpoint               => 'beansstreettry1.s3-website-ap-northeast-1.amazonaws.com'
  }
  config.fog_directory  = 'beansstreettry1' 
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
end