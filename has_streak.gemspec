# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'has_streak/version'

Gem::Specification.new do |spec|
  spec.name          = "has_streak"
  spec.version       = HasStreak::VERSION
  spec.authors       = ["Garrett Martin"]
  spec.email         = ["me@garrettqmartin.com"]
  spec.description   = %q{Easily track streaks on your ActiveRecord models.}
  spec.summary       = %q{Easily track streaks on your ActiveRecord models.}
  spec.homepage      = "https://github.com/garrettqmartin8/has_streak"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activerecord'

  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
