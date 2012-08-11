# -*- encoding: utf-8 -*-
require File.expand_path('../lib/http_state/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Venelin Valkov"]
  gem.email         = %w(venelin@bapplz.com)
  gem.description   = %q{Make your html5 game save state on the server}
  gem.summary       = ""
  gem.homepage      = "https://github.com/bapplz/http_state"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "http_state"
  gem.require_paths = %w(lib)
  gem.version       = HttpState::VERSION

  gem.add_development_dependency "rspec", "~>2.11"
  gem.add_development_dependency "gem-release", "~> 0.3.1"
end
