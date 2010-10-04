require File.expand_path('../lib/asset_bundler', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'asset_bundler'
  s.version     = AssetBundler::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = [ 'Stephen Touset' ]
  s.email       = [ 'stephen@touset.org' ]
  s.homepage    = 'http://github.com/stouset/asset_bundler'
  s.summary     = 'Simple implementation of dynamic assets'
  s.description = 'A Rails Engine that allows you to put assets in app/assets
                   and use a Rails template engine to render them.'
  
  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'asset_bundler'
  
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map {|f| f =~ /^bin\/(.*)/ ? $1 : nil }.compact
  s.require_path = 'lib'
end
