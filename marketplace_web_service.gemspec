# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marketplace_web_service/version'

Gem::Specification.new do |spec|
  spec.name          = "marketplace_web_service"
  spec.version       = MWS::VERSION
  spec.authors       = ["OSA Shunsuke"]
  spec.email         = ["hhelibebcnofnenamg@gmail.com"]
  spec.summary       = %q{Simple wrapper gem for Amazon MWS(Marketplace Web Service) API.}
  spec.description   = %q{Simple wrapper gem for Amazon MWS(Marketplace Web Service) API.}
  spec.homepage      = "https://github.com/e-maido/marketplace_web_service"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
