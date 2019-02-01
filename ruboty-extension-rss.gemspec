lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/extension/rss/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-extension-rss'
  spec.version       = Ruboty::Extension::RSS::VERSION
  spec.authors       = ['zeero']
  spec.email         = ['zeero26@gmail.com']
  spec.summary       = 'Ruboty Extension - Action trigger with RSS'
  spec.description   = 'This plugin extends Ruboty framework. It give the function that bot can take action with RSS as a trigger.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'feed-normalizer'
  spec.add_runtime_dependency 'i18n'
  spec.add_runtime_dependency 'mem'
  spec.add_runtime_dependency 'ruboty'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'guard-ctags-bundler'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'pry-theme'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rb-fsevent'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'terminal-notifier'
  spec.add_development_dependency 'terminal-notifier-guard'
end
