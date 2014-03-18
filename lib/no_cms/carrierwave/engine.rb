require 'globalize'

module NoCms
  module Carrierwave
    class Engine < ::Rails::Engine
      isolate_namespace NoCms::Carrierwave
    end
  end
end
