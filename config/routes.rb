Rails.application.routes.draw do
  match '/javascripts/*path' => 'asset_bundler/javascripts#show', :defaults => { :formats => :js }
end
