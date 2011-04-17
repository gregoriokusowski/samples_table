# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "samples_table/version"

Gem::Specification.new do |s|
  s.name        = "samples_table"
  s.version     = SamplesTable::VERSION
  s.platform    = Gem::Platform::RUBY

  s.authors     = ["Gregório Chalinski Kusowski"]
  s.email       = ["gregorio.kusowski@gmail.com"]
  s.homepage    = "http://github.com/gregoriokusowski"
  s.summary     = %q{Helper to create examples table for testing}
  s.description = %q{Simple Table is a gem that enables the developer to create some examples in a table, making the job of writing specs easier}

  s.add_development_dependency 'rspec'

  s.rubyforge_project = "samples_table"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
