# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recommender/version'

Gem::Specification.new do |spec|
  spec.name          = "recommender"
  spec.version       = Recommender::VERSION
  spec.authors       = ["Nils Berenbold"]
  spec.email         = ["nils.berenbold@gmail.com"]
  spec.summary       = %q{Api for INSERT URL here}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'actionpack', '>= 3.0.0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
