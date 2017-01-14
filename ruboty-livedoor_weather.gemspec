# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/livedoor_weather/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-livedoor_weather'
  spec.version       = Ruboty::LivedoorWeather::VERSION
  spec.authors       = ['SHIOYA, Hiromu']
  spec.email         = ['kwappa.856@gmail.com']

  spec.summary       = 'Ruboty handler to show Livedoor Weather'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/kwappa/ruboty-livedoor_weather'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',  '~>  1.13'
  spec.add_development_dependency 'rake',     '~> 12.0'
  spec.add_development_dependency 'minitest', '~>  5.0'
end
