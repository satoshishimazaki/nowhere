CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJAPVQ3OJU7QPA2OA',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1'
  }

  config.fog_directory = 'beansstreettry1'
end