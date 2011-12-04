# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "scrub_jpeg/version"

Gem::Specification.new do |s|
  s.name        = "scrub_jpeg"
  s.version     = ScrubJpeg::VERSION
  s.authors     = ["Norbert Wojtowicz"]
  s.email       = ["wojtowicz.norbert@gmail.com"]
  s.homepage    = "https://github.com/pithyless/scrub_jpeg"
  s.summary     = "Scrubs your images free of excess metadata."
  s.description = s.summary

  s.rubyforge_project = "scrub_jpeg"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency 'exiv2', '0.0.6'
end
