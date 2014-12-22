NoCms::Carrierwave.configure do |config|

  # Here we configure which image versions should be created (e.g thumbs)
  # This setting is a hash where the key is the name of the version and the value are the dimensions of the image
  # config.images_versions = {
  #   thumb: [200, 200]
  # }

  # Here we configure storage option for carrierwave. Default is :file, but if we want to use s3 through Fog we should ser :fog
  # config.storage = :file

  # Resizing animated gifs can be troubling as it may take a lot of time. By default it's disabled.
  # config.disable_animated_gif_versions = true

end
