# -*- coding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "findlinks/version"

Gem::Specification.new do |spec|
  spec.name          = "findlinks"
  spec.version       = Findlinks::VERSION
  spec.authors       = ["Klaus Stein"]
  spec.email         = ["apps@istik.de"]

  spec.summary       = %q{Find links in the various attributes of a HTML page.}
  spec.description   = <<EOT
A HTML page may contain links/references to other pages/files/images etc.
in various attributes of several elements (a.href, img.src, …).
This gem collects these links (e.g. for crawling).
EOT
  spec.homepage      = "https://github.com/Lapizistik/findlinks"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.1'
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri" # we use nothing fancy, any version should do
  spec.has_rdoc = "yard"
end
