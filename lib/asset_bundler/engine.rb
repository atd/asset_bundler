require 'asset_bundler'

class AssetBundler::Engine < ::Rails::Engine
  initializer 'asset_bundler.mime_types' do
    Mime::Type.register "image/jpeg", :jpeg, [ "image/pjpeg" ]
    Mime::Type.register "image/gif", :gif
    Mime::Type.register "image/png", :png, [ "image/x-png" ]
  end
end
