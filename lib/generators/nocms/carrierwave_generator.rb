module NoCms
  class CarrierwaveGenerator < Rails::Generators::Base

    source_root File.expand_path("../templates/", __FILE__)

    def generate_nocms_pages_initializer
      template "config/initializers/nocms/carrierwave.rb", File.join(destination_root, "config", "initializers", "nocms", "carrierwave.rb")
    end

    def self.namespace
      "nocms:carrierwave"
    end

  end
end
