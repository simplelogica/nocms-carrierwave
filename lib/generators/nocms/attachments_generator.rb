module NoCms
  class PagesGenerator < Rails::Generators::Base

    source_root File.expand_path("../templates/", __FILE__)

    def generate_nocms_pages_initializer
      template "config/initializers/nocms/attachments.rb", File.join(destination_root, "config", "initializers", "nocms", "attachments.rb")
    end

    def self.namespace
      "nocms:attachments"
    end

  end
end
