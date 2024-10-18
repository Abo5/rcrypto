# RCrypto.gemspec
Gem::Specification.new do |spec|
  spec.name          = "rcrypto"
  spec.version       = "1.0.6"
  spec.authors       = "MAVEN"
  spec.email         = "aszda33@gmail.com"

  spec.required_ruby_version = ">= 3.0"


  spec.summary       = "A custom encryption library for Ruby."
  spec.description   = "RCrypto provides custom encryption methods including XOR, Caesar cipher, and substitution cipher for secure communication in Ruby applications."
  spec.homepage      = "https://github.com/Abo5/rcrypto"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"] + Dir["spec/**/*.rb"] + ["README.md", "LICENSE"]
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.add_runtime_dependency "digest", "~> 3.1.1"
  spec.add_runtime_dependency "securerandom", "~> 0.3.1"
  spec.add_runtime_dependency "base64", "~> 0.2.0"
  


  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
