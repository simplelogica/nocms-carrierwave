module NoCms
  module Carrierwave
    include ActiveSupport::Configurable

    config_accessor :images_versions
    config_accessor :storage
    config_accessor :disable_animated_gif_versions

    self.images_versions = []
    self.storage = :file
    self.disable_animated_gif_versions = true

  end
end
