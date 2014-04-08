module NoCms
  module Carrierwave
    include ActiveSupport::Configurable

    config_accessor :images_versions
    config_accessor :storage

    self.images_versions = []
    self.storage = :file

  end
end
