class AssetBundler::JavascriptsController < AssetBundler::AssetsController
  self.view_paths = [
    Rails.root.join('app/assets'),
    AssetBundler::Engine.root.join('app/assets')
  ]
  
  respond_to :js
  
  def controller_path
    'javascripts'
  end
  
  protected
  
  def expansion?
    expansions = ActionView::Helpers::AssetTagHelper.javascript_expansions
    (expansions.keys.map(&:to_s) + ['all']).include? params[:path]
  end
end
