# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-box/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Bleigh"]
  gem.email         = ["michael@intridea.com"]
  gem.description   = %q{OmniAuth strategy for Box.net}
  gem.summary       = %q{OmniAuth strategy for Box.net}
  gem.homepage      = "https://github.com/mbleigh/omniauth-box"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-box"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Box::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'box-api'
end
