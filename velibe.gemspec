# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'velibe/version'

Gem::Specification.new do |spec|
  spec.name          = 'velibe'
  spec.version       = Velibe::VERSION
  spec.authors       = ['Adriean Khisbe']
  spec.email         = ['adriean.khisbe@live.fr']
  spec.summary       = %q{Small Velib Utility}
  spec.description   = %q{Wrapper for Velib api, for no-fuss cycling}
  spec.homepage      = 'https://github.com/AdrieanKhisbe/velibe' 
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'http', '~> 0.9.8'
  spec.add_dependency 'sqlite3'
  spec.add_dependency 'activerecord'
  spec.add_dependency 'moneta', '~> 0.8'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'jazz_fingers'
  spec.add_development_dependency 'method_source', '>= 0.8.2'
end
