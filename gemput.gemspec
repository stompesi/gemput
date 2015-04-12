# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'gemput/version'

Gem::Specification.new do |s|
  s.name          = "gemput"
  s.version       = Gemput::VERSION
  s.authors       = ["stompesi", "FeGs"]
  s.email         = ["stompesi@gmail.com"]
  s.summary       = %q{The best way to manage your gemfile's version.}
  s.description   = %q{The best way to manage your gemfile's version.}
  s.homepage      = "https://github.com/stompesi/gemput"

  s.add_development_dependency "bundler", "~> 1.9"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_dependency 'gems', '~> 0.8.3'

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  s.executables   = %w(gemput)
  s.require_paths = ["lib"]
end
