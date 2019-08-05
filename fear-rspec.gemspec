lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fear/rspec/version'

Gem::Specification.new do |spec|
  spec.name          = 'fear-rspec'
  spec.version       = Fear::Rspec::VERSION
  spec.authors       = ['Tema Bolshakov']
  spec.email         = ['abolshakov@spbtv.com']

  spec.summary       = 'RSpec matchers for Fear gem'
  spec.description   = 'RSpec matchers for Fear gem'
  spec.homepage      = 'https://github.com/bolshakov/fear-rspec'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rubocop', '0.65.0'
  spec.add_development_dependency 'rubocop-rspec', '1.35.0'

  spec.add_runtime_dependency 'fear', '>= 1.0.0'
  spec.add_runtime_dependency 'rspec', '~> 3.0'
end
