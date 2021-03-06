# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'classy_attribute/version'

Gem::Specification.new do |spec|
  spec.name          = "classy_attribute"
  spec.version       = ClassyAttribute::VERSION
  spec.authors       = ["John Britton"]
  spec.email         = ["public@johndbritton.com"]
  spec.summary       = %q{Give your ActiveRecord attributes some class.}
  spec.description   = %q{Provies a simple way to wrap ActiveRecord attributes with feature rich domain objects.}
  spec.homepage      = "https://github.com/johndbritton/classy_attribute"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
