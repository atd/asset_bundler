require 'asset_bundler'
require 'active_support'
require 'action_controller/metal'

class AssetBundler::AssetsController < ActionController::Metal
  include ActionController::Rendering
  include ActionController::MimeResponds
  include ActionController::Streaming
  
  self.view_paths = AssetBundler.paths
  
  def go
    # Always cache resources. It's the responsibility of the asset tag to
    # invalidate the browser cache with a cache-busting query string.
    headers['Cache-Control'] = 'public'
    headers['Expires']       = 1.year.from_now.httpdate

    begin
      template = find_template(File.join(self.controller_name, self.expansion_for(params[:path])))
      send_file template.identifier,
                :type => formats.first,
                :disposition => 'inline'
    rescue
      raise(ActionController::RoutingError,
            "No route matches #{ request.path.inspect }")
    end
  end
  
  protected
  
  #
  # Counterintuitively, if caching is enabled, we disable Rails caching of
  # the asset template, and assume that it's being cached above us in the
  # app stack. If caching is disabled, use builtin caching to keep the
  # rendered asset in memory until the file on disk changes.
  #
  # TODO: perhaps this should have its own configuration option, in case
  # caching is enabled but there's no Rack::Cache or Varnish in front of us.
  #
  def details_for_lookup
    { :cache => !config.perform_caching }
  end
  
  #
  # Expands +path+ into its corresponding assets if it's a registered
  # expansion. Otherswise, returns +path+.
  #
  def expansion_for(path)
    expansion?(path.to_s) ? expansions[path.to_sym] : path
  end
end
