require 'asset_bundler/version'
require 'asset_bundler/routing'
require 'asset_bundler/engine'
require 'asset_bundler/rails/ext'

module AssetBundler
  mattr_accessor :paths
  @@paths = []
end
