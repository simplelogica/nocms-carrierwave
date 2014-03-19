module NoCms
  module Carrierwave
    include ActiveSupport::Configurable

    config_accessor :images_versions

    self.images_versions = []

  end
end
