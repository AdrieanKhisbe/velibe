# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'VeLibe/version'

Gem::Specification.new do |spec|
  spec.name          = "VeLibe"
  spec.version       = VeLibe::VERSION
  spec.authors       = ["Adriean Khisbe"]
#  spec.email         = ["adriean.khisbe@live.fr"]
# No mail for now
  spec.summary       = %q{Small Velib Utility}
  spec.description   = %q{Wrapper for Velib api, for no-fuss cycling}
#  spec.homepage      = "" # then github?
  spec.license       = "MIT" # see other licences?

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
