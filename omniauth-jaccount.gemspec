require File.expand_path("../lib/omniauth/jaccount/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-jaccount"
  spec.version       = Omniauth::Jaccount::VERSION
  spec.authors       = ["feynixs"]
  spec.email         = ["feynixs@gmail.com"]

  spec.summary       = %q{omniauth for jaccount}


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~> 1.5'
  spec.add_dependency 'omniauth-oauth2', '>= 1.4.0', '< 2.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
