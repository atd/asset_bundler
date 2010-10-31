require 'rails/engine'

class Rails::Engine
  initializer :add_asset_paths do |app|
    paths.app.assets = "app/assets"

    AssetBundler.paths += paths.app.assets.to_a
  end
end
