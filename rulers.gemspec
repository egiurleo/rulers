# frozen_string_literal: true

require_relative "lib/rulers/version"

Gem::Specification.new do |spec|
  spec.name          = "rulers"
  spec.version       = Rulers::VERSION
  spec.authors       = ["Emily Giurleo"]
  spec.email         = ["e.m.giurleo@gmail.com"]

  spec.summary       = "A Rack-based Web Framework"
  spec.description   = "A Rack-based Web Framework, but with extra awesome."
  spec.homepage      = ""
  spec.required_ruby_version = ">= 2.4.0"

  spec.files             = Dir.glob('{lib}/**/*')
  spec.files             += ['rulers.gemspec']

  spec.add_runtime_dependency "rack"

  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "minitest"
end
