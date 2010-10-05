Rails.application.routes.draw do
  match '/javascripts/expansions/*path.:format' => 'asset_bundler/javascripts#index'
  match '/javascripts/*path.:format'            => 'asset_bundler/javascripts#show'
  
  match '/stylesheets/expansions/*path.:format' => 'asset_bundler/stylesheets#index'
  match '/stylesheets/*path.:format'            => 'asset_bundler/stylesheets#show'
end
