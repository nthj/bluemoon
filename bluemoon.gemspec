require File.expand_path("../lib/bluemoon/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'bluemoon'
  gem.version     = Bluemoon::VERSION
  gem.date        = Date.today.to_s
  gem.licenses    = %w[MIT]

  gem.summary     = "bluemoon"
  gem.description = "Enable or disable bluetooth on OS X based on your current location"

  gem.authors     = ['Nathaniel Jones']
  gem.email       = 'nj@third.io'
  gem.homepage    = 'http://github.com/nthj/bluemoon'

  gem.add_dependency('rake')
  gem.add_dependency('json')
  gem.add_dependency('plist')

  # ensure the gem is built out of versioned files
  gem.files       = Dir['ext/**/*', 'lib/**/*'] + %w[README.md LICENSE]

  gem.executables = %w[bluemoon get-location]

  gem.require_paths = %w[lib]

  gem.requirements << 'blueutil, sleepwatcher, get-location, terminal-notifier'
end
