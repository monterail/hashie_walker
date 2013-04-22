# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "hashie_walker"
  spec.version       = "0.1.1"
  spec.authors       = ["Michał Szajbe"]
  spec.email         = ["michal.szajbe@gmail.com"]
  spec.description   = %q{Hash-version of Array's map method that is recursive and works on keys and values simultaneously.}
  spec.summary       = %q{Handy hash traverse and transform tool}
  spec.homepage      = "http://github.com/monterail/hashie_walker"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "multiblock", "~> 0.2.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
