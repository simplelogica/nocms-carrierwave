$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "no_cms/carrierwave/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nocms-carrierwave"
  s.version     = NoCms::Carrierwave::VERSION
  s.authors     = ["Simplelogica"]
  s.email       = ["gems@simplelogica.net"]
  s.homepage    = "https://github.com/simplelogica/nocms-pages"
  s.summary     = "Adapter for using carrierwave inside NoCms."
  s.description = "This gem includes just a model which can be reused in other models in the app."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", '~> 4.0', '>= 4.0.3'
  s.add_dependency "globalize", '~> 4.0', '>= 4.0.0'

  s.add_development_dependency "sqlite3"
end
